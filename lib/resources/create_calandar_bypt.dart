import 'package:egtspt/api/schedule_api.dart';
import 'package:egtspt/handler/create_calendar_pt_handler.dart';
import 'package:egtspt/models/list_gymer_accept_model.dart';

import 'package:egtspt/resources/ne/widgets/input_field.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CreateCalanderByPT extends StatefulWidget {
  final GymerPackages dataListGymerCre;
  const CreateCalanderByPT({super.key, required this.dataListGymerCre});

  @override
  State<CreateCalanderByPT> createState() => _CreateCalanderByPTState();
}

class _CreateCalanderByPTState extends State<CreateCalanderByPT> {
  // TextEditingController _noteController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime today = DateTime.now();
  int numSessions = 8;
  List<DateTime> selectedDays = [];
  DateTime focusDate = DateTime.now();
  @override
  void initState() {
    _startDate = DateTime.now().add(const Duration(days: 1));
    numSessions = widget.dataListGymerCre.numberOfSession ?? 0;
    _startDate = DateTime.parse(widget.dataListGymerCre.from!);
    if (widget.dataListGymerCre.isUpdate == true) {
      // call api
      ScheduleAPI().getListDate().then((value) {
        for (var e in value.dataUpdateCalendar!) {
          selectedDays.add(DateTime.parse(e.date!));
        }
        setState(() {});
      });
    }
    _endDate = DateTime.now().add(Duration(days: numSessions));
    super.initState();
  }
  // String _endTime = "7:30 PM";
  // String _starTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        title: Text(
          'Tổng Quát Khóa Tập',
          style: appBarStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Tổng Quát Khóa Tập",
              //   style: headingStyle,
              // ),
              MyInputField(
                title: "Ngày Bắt Đầu Lịch Tập:",
                hint: DateFormat.yMd().format(_startDate),
                widget: IconButton(
                  onPressed: () async {
                    _startDate = await _getDateFromUSer(_startDate);
                    if ((_endDate.difference(_startDate).inHours / 24).round() <
                        numSessions) {
                      _endDate = _startDate.add(Duration(days: numSessions));
                    }
                    selectedDays.clear();
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                ),
              ),
              MyInputField(
                title: "Ngày Kết Thúc Lịch Tập Dự Kiến :",
                hint: DateFormat.yMd().format(_endDate),
                widget: IconButton(
                  onPressed: () async {
                    _endDate = await _getDateFromUSer(_endDate, isEnd: true);
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Số buổi tập: ${selectedDays.length} / $numSessions",
                style: titleStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                child: TableCalendar(
                  rowHeight: 40,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) {
                    DateTime newday = DateTime(day.year, day.month, day.day);
                    return selectedDays.contains(newday);
                  },
                  focusedDay: focusDate,
                  firstDay: _startDate,
                  lastDay: _endDate,
                  locale: 'vi_VN',
                  onDaySelected: (day, focusedDay) {
                    DateTime newday = DateTime(day.year, day.month, day.day);
                    focusDate = newday;
                    if (selectedDays.contains(newday)) {
                      selectedDays.remove(newday);
                    } else {
                      if (selectedDays.length < numSessions) {
                        selectedDays.add(newday);
                      } else {
                        SnackBar snackBar = SnackBar(
                          content: const Text("Bạn đã chọn đủ số ngày"),
                          action: SnackBarAction(
                            label: "Đóng",
                            onPressed: () {
                              //do something
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    setState(() {});
                  },
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
                      setState(() {});
                      if (selectedDays.length == numSessions) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Xác Nhận Tạo Lịch '),
                              content:
                                  const Text('Bạn có chắc chắn muốn Tạo Lịch?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Huỷ dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Huỷ'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    CreateCalendarHandler().cCalendarBtnClk(
                                        context,
                                        widget.dataListGymerCre.packageGymerId,
                                        _startDate.toString(),
                                        _endDate.toString(),
                                        selectedDays);
                                  },
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        SnackBar snackBar = const SnackBar(
                          content:
                              Center(child: Text("Bạn chưa chọn đủ số ngày")),
                          backgroundColor: Colors.blueGrey,
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      'Tạo Lịch ',
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

  Future<DateTime> _getDateFromUSer(DateTime selDate,
      {bool isEnd = false}) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: selDate,
      firstDate:
          isEnd ? _startDate.add(Duration(days: numSessions)) : DateTime.now(),
      lastDate: DateTime(2136),
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
      focusDate = pickerDate;
      return pickerDate;
    }
    return selDate;
  }
}
