import 'package:egtspt/api/session_result_gymer_api.dart';
import 'package:egtspt/models/session_result_gymer_model.dart';

import 'package:flutter/material.dart';

import '../resources/home_page.dart';

class SessionGymerResultHandler {
  Future<void> createSessionResultGymer(
      context, sessionId, caloConsump, note) async {
    // String ptid = await CommonData().getUserID();
    PTCreateSessionResultModel createSessionResultGymerCommit =
        await SessionResultGymerAPI()
            .createSessionResultGymer(context, sessionId, caloConsump, note);
    if (200 == createSessionResultGymerCommit.code) // success case
    {
      final snackBar = SnackBar(
        content: Text(createSessionResultGymerCommit.message ?? ""),
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

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      final snackBar = SnackBar(
        content: Text(createSessionResultGymerCommit.message ?? ""),
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
