import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/list_excercise_model.dart';
import '../resources/home_page.dart';
import '../router.dart';

class V2UpdateScheduleDetailAPI {
  Future<void> v2UpdateScheduleAPI(context, sessionID, date, from, to,
      List<DataExcercisePt> listExcercise) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    List<String> listEPT = [];
    for (var element in listExcercise) {
      listEPT.add(element.id!);
    }
    from = "${from.substring(0, 5)}:00";
    to = "${to.substring(0, 5)}:00";

    try {
      http.Response response = await http.put(
        Uri.parse("$sPreApiUrl/Sessions/UpdateSessionExercise/$sessionID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'dateTime': "${date.toString().substring(0, 10)}T00:00:00",
          "from": from,
          "to": to,
          "listExcercise": listEPT,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Cập Nhật Thành Công'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                child: const Text('Trở về'),
              ),
            ],
          ),
        );
      } else if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Cập nhật thất bại'),
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
      } else {
        "";
      }
    } catch (e) {
      rethrow;
    }
  }
}
