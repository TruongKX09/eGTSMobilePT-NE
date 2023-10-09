import 'package:egtspt/handler/workpt_schedule_handler.dart';
import 'package:egtspt/resources/day_list_excercise_gymer_page.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

import 'package:egtspt/untils/date_untils.dart' as date_util;

import '../common_data.dart';
import '../untils/colors_wimtil.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();
  // String scheID = '';
  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    // ScheduleGymer()
    //     .onFetchExcerciseSchedule()
    //     .then((value) => scheID = value.data!.first.id!);
    super.initState();
    currentDateTime = DateTime.now();
  }

  Widget backgroundView() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffcbb682),
      ),
    );
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
      width: width,
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 80,
            height: 140,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: (currentMonthList[index].day != currentDateTime.day)
                        ? [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.6)
                          ]
                        : [
                            HexColor("cbb682"),
                            HexColor("cbb682"),
                            HexColor("cbb682")
                          ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 0.5, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 2,
                    color: Colors.black12,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      height: height * 0.35,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              HexColor("488BC8").withOpacity(0.7),
              HexColor("488BC8").withOpacity(0.5),
              HexColor("488BC8").withOpacity(0.3)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 0.5, 1.0],
            tileMode: TileMode.clamp),
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(4, 4),
              spreadRadius: 2)
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  Widget excerciseList() {
    return FutureBuilder(
        future: WorkPTScheduelHandler().onFetWorkPTSchedule(
            CommonData().convertDate(currentDateTime.toString())),
        builder: (context, snapshot) {
          if ((snapshot.hasData) && (snapshot.data!.dataWorkPTs!.isNotEmpty)) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
              width: width,
              height: height * 0.60,
              child: ((snapshot.data?.dataWorkPTs != null) &&
                      (snapshot.data!.dataWorkPTs!.first.gymerName != []))
                  ? ListView.builder(
                      itemCount: snapshot.data?.dataWorkPTs?.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index1) {
                        return Column(
                          children: [
                            Text("Gymer Thứ ${index1 + 1}"),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                              width: width - 20,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white12,
                                        blurRadius: 2,
                                        offset: Offset(2, 2),
                                        spreadRadius: 3)
                                  ]),
                              child: ListTile(
                                title: Text(
                                    snapshot
                                        .data!.dataWorkPTs![index1].gymerName!,
                                    style: namePKStyle),
                                leading: Text(
                                  'Bắt Đầu: ${snapshot.data!.dataWorkPTs![index1].from?.split('T')[1].replaceAll(RegExp(r':\d{2}$'), '')}\nKết Thúc: ${snapshot.data!.dataWorkPTs![index1].to?.split('T')[1].replaceAll(RegExp(r':\d{2}$'), '')}',
                                  style: titleStyle,
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DayListExcerciseGymer(
                                                  listExcerciseGymer: snapshot
                                                      .data!
                                                      .dataWorkPTs![index1]),
                                        ));
                                  },
                                  child: const Icon(
                                      Icons.content_paste_search_outlined),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                  : const Center(
                      child: SizedBox(
                        height: 100,
                        child: Text(
                          'Ngày này không có Gymer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
            );
          } else {
            return const Center(
              child: SizedBox(
                height: 100,
                child: Text(
                  'Ngày này không có Gymer',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[backgroundView(), topView(), excerciseList()],
      ),
      // floatingActionButton: floatingActionBtn()
    );
  }
}
