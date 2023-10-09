import 'package:egtspt/handler/ne/create_food_ne_handler.dart';

import 'package:flutter/material.dart';

import '../commom_padding.dart';

class CreateFoodPage extends StatefulWidget {
  const CreateFoodPage({super.key});

  @override
  State<CreateFoodPage> createState() => _CreateFoodPageState();
}

class _CreateFoodPageState extends State<CreateFoodPage> {
  CreateFoodNEHandler createFoodNEHandler = CreateFoodNEHandler();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _unitOfMesuament = TextEditingController();
  final TextEditingController _calories = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tạo món ăn'),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              customPadding(
                  _name, 'Tên Thực Phẩm', const Icon(Icons.food_bank_rounded),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Tên Thực Phẩm! ';
                }
                return null;
              }),
              const SizedBox(
                height: 20.0,
              ),
              customPadding(_amount, 'Khối Lượng',
                  const Icon(Icons.monitor_weight_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Khối Lượng! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              const SizedBox(
                height: 20.0,
              ),
              customPadding(_unitOfMesuament, 'Đơn Vị Tính',
                  const Icon(Icons.monitor_weight_sharp), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Đơn Vị Tính! ';
                }
                return null;
              }),
              const SizedBox(
                height: 20.0,
              ),
              customPadding(_calories, 'Năng Lượng Thực Phẩm',
                  const Icon(Icons.local_fire_department_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Năng Lượng Thực Phẩm! ';
                }
                return null;
              }, textInputType: TextInputType.number),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('XÁC NHẬN'),
                        content: const Text('Bạn chắc chắn tạo món ăn này?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey),
                            child: const Text('Hủy Bỏ'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await createFoodNEHandler.cFoodNEBtnClk(
                                    context,
                                    _name.text,
                                    _amount.text,
                                    _unitOfMesuament.text,
                                    _calories.text);
                                if (mounted) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffcbb682)),
                            child: const Text('Xác Nhận'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffcbb682)),
                child: const Text('Tạo món ăn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
