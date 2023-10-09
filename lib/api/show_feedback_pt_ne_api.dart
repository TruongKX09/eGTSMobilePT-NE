import 'dart:convert';

import 'package:egtspt/common_data.dart';
import 'package:egtspt/models/show_feedback_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class ShowPTNEFeedBackAPI {
  Future<ShowFeedBackPtne> fetchShowPTNEFeedBack() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String userId = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Feedback/GetFeedbackListByExpertID?expertID=$userId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          ShowFeedBackPtne.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
