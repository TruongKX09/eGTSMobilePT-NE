import 'package:egtspt/api/create_calendar_bypt_api.dart';

import 'package:egtspt/models/create_calendar_pt_model.dart';

import 'package:flutter/material.dart';

import '../resources/home_page.dart';

class CreateCalendarHandler {
  Future<void> cCalendarBtnClk(
    context,
    packageGymerID,
    startDate,
    endDate,
    List<DateTime> listDate,
  ) async {
    // String ptid = await CommonData().getUserID();
    CreateCalendarPt createCalendarPTCommit = await CalendarAPI()
        .callCreateCalendar(
            context, packageGymerID, startDate, endDate, listDate);
    if (200 == createCalendarPTCommit.code) // success case
    {
      // Them  dialog (noi dung text dialog = accountCommit.message)
      // Icon dialog = thanh cong

      final snackBar = SnackBar(
        content: Text(createCalendarPTCommit.message ?? ""),
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

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(createCalendarPTCommit.message ?? ""),
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
  }
}
