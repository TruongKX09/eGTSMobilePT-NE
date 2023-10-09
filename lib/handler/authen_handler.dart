import 'package:egtspt/common_data.dart';
import 'package:egtspt/resources/ne/home_ne_page.dart';
import 'package:egtspt/resources/videocallandchat/login_service.dart';
import 'package:flutter/material.dart';

import '../api/author_api.dart';
import '../models/user_model.dart';
import '../resources/home_page.dart';
import '../resources/login_page.dart';

class AuthenHandler {
  Future<void> regisBtnClk(context, phonenum, String password, String fullname,
      String gender, String image) async {
    RegisAccount accountCommit = await AuthenAPI()
        .callRegister(phonenum, password, image, fullname, gender);
    if (200 == accountCommit.code) // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      final snackBar = SnackBar(
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> loginBtnClk(context, phonenum, String password) async {
    LoginAccount accountCommit =
        await AuthenAPI().callLogin(phonenum, password);

    if (200 == accountCommit.code ||
        accountCommit.data?.id == "") // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong
      if (CommonData().isPT(accountCommit.data!.role)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
      if (CommonData().isNE(accountCommit.data!.role)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeNEPage()),
        );
      }

      onloginSuccess(
        userID: accountCommit.data!.id!,
        userName: 'PT: ${accountCommit.data!.fullname}',
      ).then((value) {
        onUserLogin();
      });

      final snackBar = SnackBar(
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 120,
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
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 120,
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
