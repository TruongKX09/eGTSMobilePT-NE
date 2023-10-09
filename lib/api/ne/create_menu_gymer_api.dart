import 'dart:convert';

import 'package:egtspt/models/ne/list_food_ne_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../router.dart';

class CreateMenuGymerAPI {
  Future<void> callCreateMenuGymer(
      context,
      packageGymerID,
      List<DataFood> foodBreak,
      List<DataFood> foodLunch,
      List<DataFood> foodDinner,
      List<DataFood> foodBeforeWorkout,
      sartDate,
      endDate) async {
    List<String> listBreak = [];
    for (var element in foodBreak) {
      listBreak.add(element.id!);
    }

    List<String> listLunch = [];
    for (var element in foodLunch) {
      listLunch.add(element.id!);
    }
    List<String> listDinner = [];
    for (var element in foodDinner) {
      listDinner.add(element.id!);
    }
    List<String> listBeforeWorkout = [];
    for (var element in foodBeforeWorkout) {
      listBeforeWorkout.add(element.id!);
    }

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Meals/CreateMeal"),
        body: jsonEncode({
          "packageGymerID": packageGymerID,
          "monAnSang": listBreak.toList(),
          "monAnTrua": listLunch.toList(),
          "monAnToi": listDinner.toList(),
          "monAnTruocTap": listBeforeWorkout.toList(),
          "fromDatetime": "${sartDate.toString().substring(0, 10)}T00:00:00",
          "toDatetime": "${endDate.toString().substring(0, 10)}T00:00:00"
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final snackBar = SnackBar(
          content: Text(response.body),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            left: 10,
            right: 10,
          ),
          action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          content: Text(response.body),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            left: 10,
            right: 10,
          ),
          action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      rethrow;
    }
  }
}
