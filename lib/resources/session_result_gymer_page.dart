import 'package:egtspt/handler/session_result_gymer_handler.dart';
import 'package:egtspt/resources/commom_padding.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

class SessionResultGymerPage extends StatefulWidget {
  final String? idsession;

  const SessionResultGymerPage({super.key, required this.idsession});

  @override
  State<SessionResultGymerPage> createState() => _SessionResultGymerPageState();
}

class _SessionResultGymerPageState extends State<SessionResultGymerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController calories = TextEditingController();
  final TextEditingController notegymer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kết Quả Luyện Tập',
          style: appBarStyle,
        ),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          customPadding(calories, 'Năng Lượng Gymer Tiêu Thụ',
              const Icon(Icons.fireplace_sharp), (value) {
            if (value!.isEmpty) {
              return 'Hãy nhập số năng lượng tiêu thụ! ';
            }
            return null;
          }, textInputType: TextInputType.number),
          customPadding(notegymer, 'Ghi Chú Kết Quả Luyện Tập',
              const Icon(Icons.description_outlined), (value) {
            if (value!.isEmpty) {
              return ' Hãy Nhập Ghi Chú Kết Quả Luyện Tập! ';
            }
            return null;
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffcbb682),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SessionGymerResultHandler().createSessionResultGymer(
                      context,
                      widget.idsession,
                      calories.text,
                      notegymer.text,
                    );
                  }
                },
                child: const Text(
                  'Gửi Kết Quả',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
