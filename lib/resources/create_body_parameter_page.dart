// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../handler/create_body_parameter_handler.dart';
import 'commom_padding.dart';

class CreateBodyParameterPage extends StatefulWidget {
  final String? gymerid;
  const CreateBodyParameterPage({super.key, required this.gymerid});

  @override
  State<CreateBodyParameterPage> createState() =>
      _CreateBodyParameterPageState();
}

class _CreateBodyParameterPageState extends State<CreateBodyParameterPage> {
  CreateBodyParameterHandler createBodyParameterHandler =
      CreateBodyParameterHandler();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goal = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _bone = TextEditingController();
  final TextEditingController _fat = TextEditingController();
  final TextEditingController _muscle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MỤC TIÊU')),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Text(
                  "Hãy Nhập Tỉ Lệ Cơ Thể Khách Hàng!",
                  style: TextStyle(fontSize: 20, color: Color(0xff606470)),
                ),
              ),
              customPadding(_goal, 'Mục Tiêu', const Icon(Icons.grade_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập mục tiêu khách hàng! ';
                }
                return null;
              }),
              customPadding(_weight, 'Cân Nặng',
                  const Icon(Icons.monitor_weight_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Cân Nặng! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              customPadding(
                  _height, 'Chiều Cao', const Icon(Icons.height_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Chiều Cao! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              customPadding(
                  _bone, 'Phần Trăm Xương', const Icon(Icons.percent_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy Nhập Phần Trăm Xương! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              customPadding(
                  _fat, 'Phần Trăm Mỡ', const Icon(Icons.percent_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy Nhập Phần Trăm Mỡ! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              customPadding(
                  _muscle, 'Phần Trăm Cơ', const Icon(Icons.percent_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy Nhập Phần Trăm cơ! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                        createBodyParameterHandler.cBodyParameterBtnClk(
                            context,
                            widget.gymerid,
                            _goal.text,
                            _weight.text,
                            _height.text,
                            _bone.text,
                            _fat.text,
                            _muscle.text);

                        print(widget.gymerid);
                      }
                    },
                    child: const Text(
                      'Gửi',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
