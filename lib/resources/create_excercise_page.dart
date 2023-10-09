import 'dart:io';

import 'package:egtspt/handler/create_excercise_handler.dart';
import 'package:egtspt/resources/pick_video_pt_page.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'commom_padding.dart';

class CreateExcercisePage extends StatefulWidget {
  const CreateExcercisePage({super.key});

  @override
  State<CreateExcercisePage> createState() => _CreateExcercisePageState();
}

class _CreateExcercisePageState extends State<CreateExcercisePage> {
  CreateExcerciseHandler createExcerciseHandler = CreateExcerciseHandler();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _assignmentName = TextEditingController();
  final TextEditingController _calorieCumsumption = TextEditingController();
  final TextEditingController _repTime = TextEditingController();
  final TextEditingController _unitOfMeasurement = TextEditingController();

  final TextEditingController _assignmentDescription = TextEditingController();
  // late File _assignmentFile;
  bool _isUploading = false;
  bool isCheckVideo = false;
  File? _videoFile;
  String _videoFirebaseURL = "";
  double _uploadProgress = 0.0;

  Future<void> uploadVideo() async {
    if (_videoFile == null) return;
    try {
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');
      final UploadTask uploadTask = storageRef.putFile(_videoFile!);
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        setState(() {
          _uploadProgress = (snapshot.bytesTransferred.toDouble() /
                  snapshot.totalBytes.toDouble()) *
              100;
          _isUploading = true;
        });
      });
      await uploadTask.whenComplete(() async {
        _videoFirebaseURL =
            await storageRef.getDownloadURL(); // Retrieve the download URL
        setState(() {
          _uploadProgress = 0.0;
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Video Tải Lên Thành Công')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Video Tải Lên Thất Bại')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Tạo bài tập',
          style: appBarStyle,
        ),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: AbsorbPointer(
        absorbing: _isUploading,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  customPadding(_assignmentName, 'Tên Bài Tập',
                      const Icon(Icons.fitness_center_rounded), (value) {
                    if (value!.isEmpty) {
                      return 'Hãy nhập Tên Bài Tập! ';
                    }
                    return null;
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("Video hướng dẫn:"),
                          _videoFile?.path != null
                              ? Text(
                                  "Đã chọn Video",
                                  style: discountStyle,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      IconButton(
                          onPressed: () async {
                            _videoFile = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => const PickVideoPage(),
                            ));
                            if (_videoFile?.path != null) {
                              isCheckVideo = false;
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.video_library))
                    ],
                  ),
                  isCheckVideo == true
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Chưa chọn video"),
                          ],
                        )
                      : const SizedBox(),
                  customPadding(_calorieCumsumption, 'Năng Lượng Tiêu Thụ',
                      const Icon(Icons.fireplace_sharp), (value) {
                    if (value!.isEmpty) {
                      return 'Hãy nhập số năng lượng tiêu thụ! ';
                    }
                    return null;
                  }, textInputType: TextInputType.number),
                  customPadding(_repTime, 'Thời Gian-Số Lượng',
                      const Icon(Icons.timer_outlined), (value) {
                    if (value!.isEmpty) {
                      return 'Hãy nhập Thời Gian-Số Lượng! ';
                    }
                    return null;
                  }, textInputType: TextInputType.number),
                  customPadding(_unitOfMeasurement, 'Đơn Vị Tính',
                      const Icon(Icons.monitor_weight_outlined), (value) {
                    if (value!.isEmpty) {
                      return 'Hãy nhập Đơn Vị Tính! ';
                    }
                    return null;
                  }),

                  // _assignmentFile == null
                  //     ? Text('No file selected.')
                  //     : Text(_assignmentFile.path),

                  customPadding(_assignmentDescription, 'Mô tả Bài Tập',
                      const Icon(Icons.description_outlined), (value) {
                    if (value!.isEmpty) {
                      return 'Mô tả Bài Tập! ';
                    }
                    return null;
                  }),
                  _uploadProgress > 0
                      ? LinearProgressIndicator(value: _uploadProgress / 100)
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffcbb682),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_videoFile?.path != null) {
                              isCheckVideo = false;
                              setState(() {});
                              await uploadVideo();

                              createExcerciseHandler
                                  .cExcersiteBtnClk(
                                      _assignmentName.text,
                                      _assignmentDescription.text,
                                      _videoFirebaseURL,
                                      _calorieCumsumption.text,
                                      _repTime.text,
                                      _unitOfMeasurement.text)
                                  .then((value) {
                                final snackBar = SnackBar(
                                  content: Text(value),
                                  backgroundColor: Colors.green,
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height -
                                        110,
                                    left: 10,
                                    right: 10,
                                  ),
                                  action: SnackBarAction(
                                    label: 'Đóng',
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                Navigator.of(context).pop();
                              });
                            } else {
                              isCheckVideo = true;
                              print(isCheckVideo);
                              setState(() {
                                isCheckVideo;
                              });
                            }
                          }
                        },
                        child: const Text(
                          'Tạo Bài Tập ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
