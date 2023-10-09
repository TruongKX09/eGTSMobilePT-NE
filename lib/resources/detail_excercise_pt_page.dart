import 'dart:async';

import 'package:egtspt/api/update_excercise_pt_api.dart';
import 'package:egtspt/common_data.dart';
import 'package:egtspt/models/list_excercise_model.dart';
import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailExcercisePTPage extends StatefulWidget {
  final DataExcercisePt dataExcercisePt;
  const DetailExcercisePTPage({super.key, required this.dataExcercisePt});

  @override
  State<DetailExcercisePTPage> createState() => _DetailExcercisePTPageState();
}

class _DetailExcercisePTPageState extends State<DetailExcercisePTPage> {
  late VideoPlayerController videoPlayerCtl;
  late Future<void> initializeVideoPlayerFuture;
  double videoHeight = 420;
  double videoWidth = 360;
  bool _onTouch = false;
  Timer? _timer;
  TextEditingController newCalorieCumsumptionController =
      TextEditingController();
  TextEditingController newrepTime = TextEditingController();
  TextEditingController newunitOfMeasurement = TextEditingController();
  TextEditingController newdescription = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    videoInitial(widget.dataExcercisePt.video);
    super.initState();
    newCalorieCumsumptionController.text =
        widget.dataExcercisePt.calorieCumsumption.toString();
    newrepTime.text = widget.dataExcercisePt.repTime.toString();
    newunitOfMeasurement.text =
        widget.dataExcercisePt.unitOfMeasurement.toString();
    newdescription.text = widget.dataExcercisePt.description.toString();
    isEditing = false;
  }

  bool isVideoUrl(url) {
    return url.toString().contains("http");
  }

  void videoInitial(url) {
    if (isVideoUrl(url)) {
      videoPlayerCtl = VideoPlayerController.networkUrl(
        Uri.parse(url),
      );
      initializeVideoPlayerFuture =
          videoPlayerCtl.initialize().whenComplete(() {
        setState(() {});
      });

      videoPlayerCtl.setLooping(true);
      videoPlayerCtl.play();
    } else {
      videoPlayerCtl = VideoPlayerController.networkUrl(
        Uri.parse("None"),
      );
      initializeVideoPlayerFuture = videoPlayerCtl.initialize();
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoPlayerCtl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Chi Tiết Bài Tập',
          style: namePKStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            if (isVideoUrl(widget.dataExcercisePt.video))
              SizedBox(
                width: CommonData().getScreenWidth(context, resize: 100),
                child: videoPlayerCtl.value.isInitialized
                    ? InkWell(
                        onTap: () {
                          _onTouch = true;
                          // pause while video is playing, play while video is pausing
                          videoPlayerCtl.value.isPlaying
                              ? videoPlayerCtl.pause()
                              : videoPlayerCtl.play();
                          _timer?.cancel();
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 1000), (_) {
                            setState(() {
                              _onTouch = false;
                            });
                          });
                          setState(() {});
                        },
                        child: AspectRatio(
                          aspectRatio: videoPlayerCtl.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: Stack(children: <Widget>[
                            VideoPlayer(videoPlayerCtl),
                            Visibility(
                              visible: _onTouch,
                              child: Container(
                                color: Colors.grey.withOpacity(0.5),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(
                                        side: BorderSide(color: Colors.white)),
                                    padding: const EdgeInsets.all(20),
                                  ),
                                  child: Icon(
                                    videoPlayerCtl.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    videoPlayerCtl.value.isPlaying
                                        ? videoPlayerCtl.pause()
                                        : videoPlayerCtl.play();
                                    setState(() {});
                                    _timer?.cancel();
                                    // Auto dismiss overlay after 1 second
                                    _timer = Timer.periodic(
                                        const Duration(milliseconds: 1000),
                                        (_) {
                                      setState(() {
                                        _onTouch = false;
                                      });
                                    });
                                  },
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    :
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 52,
                  width: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Tên Bài Tập: ${widget.dataExcercisePt.name}',
                      style: namePKStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (!isEditing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Số Lượng-Thời Gian: ${widget.dataExcercisePt.repTime} ${widget.dataExcercisePt.unitOfMeasurement}",
                        style: titleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (isEditing) ...[
              const Text("Số Lượng-Thời Gian"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: newrepTime,
                        decoration: const InputDecoration(
                          hintText: 'Số Lượng-Thời Gian',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Đơn Vị Tính"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: newunitOfMeasurement,
                        decoration: const InputDecoration(
                          hintText: 'Đơn vị Tính',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (!isEditing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Năng Lượng Tiêu Thụ: ${widget.dataExcercisePt.calorieCumsumption} Calories ",
                        style: nameExStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 5),
            if (isEditing) ...[
              const Text("Năng Lượng Tiêu Thụ"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        // Kết nối với TextEditingController
                        controller: newCalorieCumsumptionController,
                        decoration: const InputDecoration(
                          hintText: 'Năng Lượng Tiêu Thụ',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (!isEditing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
                      child: Text(
                        "Mô Tả Bài Tập: \n${widget.dataExcercisePt.description!.replaceAll('.', '.\n  ')}",
                        style: titleStyle,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (isEditing) ...[
              const Text("Mô Tả Bài Tập:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 82,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        // Kết nối với TextEditingController
                        controller: newdescription,
                        decoration: const InputDecoration(
                          hintText: 'Mô Tả Bài Tập',
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Hiển thị dialog xác nhận xóa
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Xác nhận xóa',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Bài Tập sẽ không thể phục hồi. Bạn chắc chắn xóa?',
                              style: titleStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Huỷ dialog
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Huỷ'),
                              ),
                              TextButton(
                                onPressed: () {
                                  UpdateExcercisePT().deleteExcercisePT(
                                      context, widget.dataExcercisePt.id);
                                },
                                child: const Text(
                                  'Xác nhận',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    label: const Text('Xóa'),
                    icon: const Icon(Icons.delete),
                    backgroundColor: Colors.blueGrey,
                    tooltip: 'Delete',
                  ),
                ),
                const Spacer(),
                if (!isEditing) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      label: const Text('Chỉnh sửa'),
                      icon: const Icon(Icons.edit),
                      backgroundColor: const Color(0xffcbb682),
                      tooltip: 'Chỉnh sửa',
                    ),
                  ),
                ],
                if (isEditing) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Xác nhận thay đổi'),
                              content: const Text(
                                  'Bạn có chắc chắn muốn lưu thay đổi?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Huỷ'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    UpdateExcercisePT().updateExcercisePT(
                                        context,
                                        widget.dataExcercisePt.id,
                                        newdescription.text,
                                        widget.dataExcercisePt.video,
                                        newCalorieCumsumptionController.text,
                                        newrepTime.text,
                                        newunitOfMeasurement.text);
                                  },
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      label: const Text('Lưu'),
                      icon: const Icon(Icons.save),
                      backgroundColor: const Color(0xffcbb682),
                      tooltip: 'Save',
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
