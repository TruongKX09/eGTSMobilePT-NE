import 'package:egtspt/api/update_schedule_pt_api.dart';
import 'package:egtspt/models/list_excercise_model.dart';

import 'package:egtspt/models/update_schedule_pt_model.dart';

import 'package:flutter/material.dart';

class CreateUpdateSchedulePTHandler {
  Future<void> cCalendarBtnClk(context, sesID, DateTime date, String from,
      String to, List<DataExcercisePt> listExcercisePT) async {
    // String ptid = await CommonData().getUserID();
    String dateStr = "${date.toString().substring(0, 10)}T00:00:00";
    List<String> listEPT = [];
    for (var element in listExcercisePT) {
      listEPT.add(element.id!);
    }
    from = "${from.substring(0, 5)}:00";
    to = "${to.substring(0, 5)}:00";
    UpdateSchedule updateScheduleCommit = await UpdateSchedulePTAPI()
        .updateSchedule(context, sesID, dateStr, from, to, listEPT);
    if (200 == updateScheduleCommit.code) {
      final snackBar = SnackBar(
        content: Text(updateScheduleCommit.message ?? ""),
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
      SnackBar(
        content: Text(updateScheduleCommit.message ?? ""),
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
    }
  }
}
