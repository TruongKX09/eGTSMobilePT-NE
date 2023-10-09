import 'dart:convert';

import 'package:egtspt/resources/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/create_calendar_pt_model.dart';
import '../router.dart';

class CalendarAPI {
  Future<CreateCalendarPt> callCreateCalendar(
    context,
    packageGymerID,
    startDate,
    endDate,
    List<DateTime> listDate,
  ) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/ExcerciseSchedules/CreateExcerciseScheduleV3"),
        body: jsonEncode({
          "packageGymerID": packageGymerID,
          "from": startDate.toString().substring(0, 10),
          "to": endDate.toString().substring(0, 10),
          "listSession":
              listDate.map((e) => e.toString().substring(0, 10)).toList()
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Đã Tạo Lịch Tổng Quát Thành Công'),
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
      final parsed =
          CreateCalendarPt.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
