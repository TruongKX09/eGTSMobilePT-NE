import 'dart:convert';
import 'package:egtspt/resources/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class UpdateExcercisePT {
  Future updateExcercisePT(context, idExcercise, description, video,
      calorieCumsumption, repTime, unitOfMeasurement) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.put(
        Uri.parse("$sPreApiUrl/Excercises/UpdateExcercise/$idExcercise"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'description': description,
          'video': video,
          'isDelete': false,
          'calorieCumsumption': calorieCumsumption,
          'repTime': repTime,
          'unitOfMeasurement': unitOfMeasurement,
        }),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
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

  Future deleteExcercisePT(context, idExcercise) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.delete(
        Uri.parse("$sPreApiUrl/Excercises/DeleteExcercise/$idExcercise"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        // body: jsonEncode({

        // }),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
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
