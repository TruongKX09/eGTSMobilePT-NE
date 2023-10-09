import 'dart:convert';

import 'package:egtspt/models/show_package_feedback_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class ShowPackageFeedBackAPI {
  Future<ShowPackageFeedBack> fetchShowPackageFeedBack(packageGymerID) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Feedback/GetFeedbackListByPackageGymerID?packageGymerID=$packageGymerID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          ShowPackageFeedBack.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
