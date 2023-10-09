import 'package:egtspt/models/update_calendar_model.dart';

import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/v2_update_schedule_detail_api.dart';

import '../models/list_excercise_model.dart';

import 'home_page.dart';
import 'list_excercise_page.dart';
import 'ne/widgets/input_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class V2UpdateScheduleGymerPage extends StatefulWidget {
  final String? idsession;
  const V2UpdateScheduleGymerPage({super.key, this.idsession});

  @override
  State<V2UpdateScheduleGymerPage> createState() =>
      _V2UpdateScheduleGymerPageState();
}

class _V2UpdateScheduleGymerPageState extends State<V2UpdateScheduleGymerPage> {
  // TextEditingController _noteController = TextEditingController();

  DataUpdateCalendar dataCalendar = DataUpdateCalendar();
  // DateTime _startDate = DateTime.now();
  // DateTime _endDate = DateTime.now();
  DateTime today = DateTime.now();
  // int numSessions = 10;
  List<DateTime> selectedDays = [];

  CalendarPt calendarPt = CalendarPt();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _starTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  List<DataExcercisePt> resultET = [];
  DateTime _selectedDate = DateTime.now();
  DateTime _selectChangeDate = DateTime.now();
  @override
  // void initState() {
  //   _startDate = DateTime.now().add(const Duration(days: 1));
  //   numSessions = widget.dataUpdate.numberOfSession ?? 0;
  //   _startDate = DateTime.parse(widget.dataUpdate.from!);
  //   if (widget.dataUpdate.isUpdate == true) {
  //     // call api
  //     ScheduleAPI().getListDate().then((value) {
  //       calendarPt = value;

  //       _selectedDate = DateTime.parse(value.dataUpdateCalendar!.first.date!);
  //       _endDate = _selectedDate;
  //       for (var e in value.dataUpdateCalendar!) {
  //         selectedDays.add(DateTime.parse(e.date!));
  //         _selectedDate = _selectedDate.isAfter(DateTime.parse(e.date!))
  //             ? DateTime.parse(e.date!)
  //             : _selectedDate;
  //         _endDate = _endDate.isBefore(DateTime.parse(e.date!))
  //             ? DateTime.parse(e.date!)
  //             : _endDate;
  //       }
  //       _selectChangeDate = _selectedDate;
  //       _startDate = _selectedDate;

  //       setState(() {});
  //     });
  //   }

  //   _endDate = DateTime.now().add(Duration(days: numSessions));
  //   super.initState();
  // }
  // String _endTime = "7:30 PM";
  // String _starTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        title: Text(
          'Thay Đổi Lịch Tập Cho Gymer',
          style: appBarStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              // Text(
              //   "Số buổi tập: ${selectedDays.length} / $numSessions",
              //   style: titleStyle,
              // ),
              const SizedBox(
                height: 8,
              ),

              createExcerciseByDate()
            ],
          ),
        ),
      ),
    );
  }

  Widget createExcerciseByDate() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInputField(
              title: "Ngày Tập:",
              hint: DateFormat.yMd().format(_selectChangeDate),
              widget: IconButton(
                onPressed: () {
                  _getDateFromUSer2();
                },
                icon: const Icon(Icons.calendar_today_outlined,
                    color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: MyInputField(
                        title: "Thời Gian Bắt Đầu:",
                        hint: _starTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: true);
                            },
                            icon: const Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            )))),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: MyInputField(
                        title: "Thời Gian Kết Thúc:",
                        hint: _endTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: false);
                            },
                            icon: const Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            )))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "Tên Bài Tập",
                    style: namePKStyle,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                      onPressed: () async {
                        resultET = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListExcercisePage(
                                    alreadySel: resultET,
                                  )),
                        );
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffcbb682),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        "Thêm Bài Tập",
                        style: nameExStyle,
                      )),
                ),
              ],
            ),
            Column(
              children: [
                Wrap(
                  children: resultET
                      .map((e) => ListTile(
                            title: Text(e.name!),
                            trailing: InkWell(
                              child: const Icon(Icons.close_outlined),
                              onTap: () {
                                resultET.remove(e);
                                setState(() {});
                              },
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 173, 163, 137),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  onPressed: () {
                    V2UpdateScheduleDetailAPI().v2UpdateScheduleAPI(
                      context,
                      widget.idsession,
                      _selectedDate,
                      _starTime,
                      _endTime,
                      resultET,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    'Cập Nhật Lịch Tập ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getDateFromUSer2() async {
    DateTime currentDate = DateTime.now();
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: currentDate,
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

    if (pickerDate != null) {
      setState(() {
        _selectChangeDate = pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime?.format(context) ?? _starTime;

    if (isStartTime) {
      setState(() {
        _starTime = formattedTime;
        _endTime = calculateEndTime(formattedTime);
      });
    } else {
      bool isInvalidEndTime = _isEndTimeInvalid(formattedTime);
      if (isInvalidEndTime) {
        _showInvalidEndTimeDialog();
      } else {
        setState(() {
          _endTime = formattedTime;
        });
      }
    }
  }

  bool _isEndTimeInvalid(String endTime) {
    TimeOfDay pickedEndTime = TimeOfDay(
      hour: int.parse(endTime.split(":")[0]),
      minute: int.parse(endTime.split(":")[1].split(" ")[0]),
    );
    TimeOfDay minEndTime = calculateMinimumEndTime();

    // Tính thời gian kết thúc tối thiểu
    TimeOfDay minValidEndTime = TimeOfDay(
      hour: minEndTime.hour,
      minute: minEndTime.minute,
    );

    // Chuyển đổi thời gian kết thúc và thời gian kết thúc tối thiểu thành đơn vị phút
    int pickedEndTimeMinutes = pickedEndTime.hour * 60 + pickedEndTime.minute;
    int minValidEndTimeMinutes =
        minValidEndTime.hour * 60 + minValidEndTime.minute;

    // Kiểm tra nếu thời gian kết thúc nhỏ hơn thời gian kết thúc tối thiểu
    if (pickedEndTimeMinutes < minValidEndTimeMinutes) {
      return true;
    }
    return false;
  }

  _showInvalidEndTimeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thông Báo"),
          content: const Text(
              "Thời gian kết thúc phải lớn hơn thời gian bắt đầu ít nhất 1 giờ."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  String calculateEndTime(String startTime) {
    TimeOfDay parsedStartTime = TimeOfDay(
      hour: int.parse(startTime.split(":")[0]),
      minute: int.parse(startTime.split(":")[1].split(" ")[0]),
    );

    TimeOfDay minEndTime = TimeOfDay(
      hour: parsedStartTime.hour + 1,
      minute: parsedStartTime.minute,
    );
    return minEndTime.format(context);
  }

  TimeOfDay calculateMinimumEndTime() {
    TimeOfDay parsedStartTime = TimeOfDay(
      hour: int.parse(_starTime.split(":")[0]),
      minute: int.parse(_starTime.split(":")[1].split(" ")[0]),
    );

    TimeOfDay minEndTime = TimeOfDay(
      hour: parsedStartTime.hour + 1,
      minute: parsedStartTime.minute,
    );
    return minEndTime;
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_starTime.split(":")[0]),
        minute: int.parse(_starTime.split(":")[1].split(" ")[0]),
      ),
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
  }
}
