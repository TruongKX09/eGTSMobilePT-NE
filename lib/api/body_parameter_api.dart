import 'dart:convert';

import 'package:egtspt/models/body_parameter_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../common_data.dart';
import '../router.dart';

class BodyParameterAPI {
  Future<BodyParameter> fetchBodyParameter() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchGymer = await CommonData().getGymerID();
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/BodyPerameters/GetBodyPerameterByGymerID/$sSearchGymer"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          BodyParameter.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }

  Future updateRequestPT(context, isAccepted) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String requestID = await CommonData().getRequestID();
    try {
      http.Response response = await http.put(
        Uri.parse("$sPreApiUrl/Requests/UpdateRequest"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({'id': requestID, 'isAccepted': isAccepted}),
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Đã cập nhật yêu cầu thành công'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
