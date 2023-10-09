import 'package:egtspt/api/ne/update_menu_gymer_api.dart';
import 'package:egtspt/models/ne/list_accept_ne_model.dart';
import 'package:egtspt/models/ne/list_food_ne_model.dart';

import 'package:egtspt/resources/ne/widgets/input_field.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'list_foodne_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class UpdateMenuGymer extends StatefulWidget {
  final GymerPackagesNE dataNeCreateMenu;
  const UpdateMenuGymer({super.key, required this.dataNeCreateMenu});

  @override
  State<UpdateMenuGymer> createState() => _UpdateMenuGymerState();
}

class _UpdateMenuGymerState extends State<UpdateMenuGymer> {
  // TextEditingController _noteController = TextEditingController();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  // String _endTime = "7:30 PM";
  // String _starTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  List<DataFood> resFood = [];
  List<DataFood> listLunch = [];
  List<DataFood> listDinner = [];
  List<DataFood> listBeforeWorkout = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        title: const Text('Cập Nhật Thực Đơn Gymer'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cập Nhật Đơn Gymer",
                style: headingStyle,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // MyInputField(
                  //   title: "Tên Bài Tập",
                  //   hint: "Chọn Bài Tập",
                  //   controller: _titleController,
                  // ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Bữa Ăn Sáng",
                      style: namePKStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                        onPressed: () async {
                          resFood = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodListPage()),
                          );
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffcbb682),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Chọn Thực Phẩm")),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(
                    children: resFood
                        .map((e) => ListTile(
                              title: Text(e.name!),
                              subtitle:
                                  Text('${e.ammount} ${e.unitOfMesuament}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  resFood.remove(e);
                                  setState(() {});
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // MyInputField(
                  //   title: "Tên Bài Tập",
                  //   hint: "Chọn Bài Tập",
                  //   controller: _titleController,
                  // ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Bữa Ăn Trưa",
                      style: namePKStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                        onPressed: () async {
                          listLunch = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodListPage()),
                          );
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffcbb682),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Chọn Thực Phẩm")),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(
                    children: listLunch
                        .map((e) => ListTile(
                              title: Text(e.name!),
                              subtitle:
                                  Text('${e.ammount} ${e.unitOfMesuament}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  listLunch.remove(e);
                                  setState(() {});
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Bữa Ăn Tối",
                      style: namePKStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                        onPressed: () async {
                          listDinner = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodListPage()),
                          );
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffcbb682),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Chọn Thực Phẩm")),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(
                    children: listDinner
                        .map((e) => ListTile(
                              title: Text(e.name!),
                              subtitle:
                                  Text('${e.ammount} ${e.unitOfMesuament}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  listDinner.remove(e);
                                  setState(() {});
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Bữa Ăn Trước Tập",
                      style: namePKStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                        onPressed: () async {
                          listBeforeWorkout = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodListPage()),
                          );
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffcbb682),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Chọn Thực Phẩm")),
                  ),
                ],
              ),
              Column(
                children: [
                  Wrap(
                    children: listBeforeWorkout
                        .map((e) => ListTile(
                              title: Text(e.name!),
                              subtitle:
                                  Text('${e.ammount} ${e.unitOfMesuament}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  listBeforeWorkout.remove(e);
                                  setState(() {});
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              MyInputField(
                title: "Ngày Bắt Đầu Thay Đổi",
                hint: DateFormat.yMd().format(_startDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUSer(isStartDate: true);
                  },
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                ),
              ),
              MyInputField(
                title: "Ngày Kết Thúc Thay Đổi",
                hint: DateFormat.yMd().format(_endDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUSer(isStartDate: false);
                  },
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
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
                      UpdateMenuGymerAPI().updateMenuGymerAPI(
                          context,
                          widget.dataNeCreateMenu.packageGymerId,
                          resFood,
                          listLunch,
                          listDinner,
                          listBeforeWorkout,
                          _startDate.toString(),
                          _endDate.toString());
                    },
                    child: const Text(
                      'Cập Nhật Thực Đơn ',
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

  _getDateFromUSer({required bool isStartDate}) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate:
          isStartDate ? _startDate.add(const Duration(days: 1)) : _endDate,
      firstDate: isStartDate
          ? currentDate.add(const Duration(days: 1))
          : _startDate.add(const Duration(days: 1)),
      lastDate: DateTime(2121),
      builder: (BuildContext context, Widget? child) {
        return Localizations(
          locale: const Locale('vi', 'VN'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          child: child!,
        );
      },
    );

    if (pickerDate == null) {
      return;
    }
    if (isStartDate) {
      if (pickerDate.isBefore(DateTime.now())) {
        // Không cho phép chọn ngày bắt đầu trước ngày hiện tại + 1 ngày
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Lỗi chọn ngày'),
              content:
                  const Text('Ngày bắt đầu không thể trước ngày hiện tại .'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _startDate = pickerDate;
          if (_endDate.isBefore(_startDate)) {
            // Nếu ngày kết thúc trước ngày bắt đầu, thì cập nhật ngày kết thúc
            _endDate = _startDate.add(const Duration(days: 1));
          }
        });
      }
    } else {
      if (pickerDate.isBefore(_startDate.add(const Duration(days: 1)))) {
        // Không cho phép chọn ngày kết thúc trước ngày bắt đầu
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Lỗi chọn ngày'),
              content:
                  const Text('Ngày kết thúc không thể trước ngày bắt đầu .'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _endDate = pickerDate;
        });
      }
    }
  }
}
