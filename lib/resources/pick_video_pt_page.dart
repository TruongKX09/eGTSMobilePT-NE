import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../untils/theme.dart';

class PickVideoPage extends StatefulWidget {
  const PickVideoPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickVideoPageState();
}

class _PickVideoPageState extends State<PickVideoPage> {
  File? _videoFile;
  String? _videoPath;
  VideoPlayerController? _controller;

  List<String> _videoUrls = [];

  @override
  void initState() {
    super.initState();
    fetchVideoUrls();
  }

  Future<void> fetchVideoUrls() async {
    List<String> videoUrls = await getAllVideoUrls();
    setState(() {
      _videoUrls = videoUrls;
    });
  }

  Future<List<String>> getAllVideoUrls() async {
    List<String> videoUrls = [];

    try {
      Reference storageRef = FirebaseStorage.instance.ref();
      ListResult listResult = await storageRef.listAll();

      for (var item in listResult.items) {
        if (item.name.endsWith('.mp4')) {
          String url = await item.getDownloadURL();
          videoUrls.add(url);
        }
      }
    } catch (error) {}

    return videoUrls;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Chọn Video',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Center(
        child: _videoFile?.path != null
            ? _videoPreviewWidget()
            : const Text('Không có Video dc chọn'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child: const Icon(Icons.video_library),
      ),
    );
  }

  pickVideoPT() async {
    final pickker = ImagePicker();
    XFile? videoFile;
    try {
      videoFile = await pickker.pickVideo(source: ImageSource.gallery);
      return videoFile?.path;
    } catch (e) {}
  }

  void _pickVideo() async {
    _videoPath = await pickVideoPT();
    setState(() {
      _videoFile = File(_videoPath!);
    });
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.file(File(_videoPath!))
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
      });
  }

  Widget _videoPreviewWidget() {
    if (_controller != null) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                if (_videoFile?.path == null) {
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context, _videoFile);
                }
              },
              child: const Text("Xác Nhận")),
          // ElevatedButton(onPressed: _uploadVideo, child: const Text('Tải Lên'))
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
