// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// final FirebaseStorage _storage = FirebaseStorage.instance;
// final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

// class StoreDate {
//   Future<String> uploadVideo(String videoUrl) async {
//     Reference ref = _storage.ref().child('videos/${DateTime.now()}.mp4');
//     await ref.putFile(File(videoUrl));
//     String downloadURL = await ref.getDownloadURL();
//     return downloadURL;
//   }

  // Future<void> saveVideoDate(String videoDownloadUrl) async {
  //   await _fireStore.collection('video').add({
  //     'url': videoDownloadUrl,
  //     'timmeStamp': FieldValue.serverTimestamp(),
  //     'name': 'User video'
  //   });
  // }
// }
