import 'package:egtspt/models/workpt_schedule_model.dart';
import 'package:egtspt/resources/session_result_gymer_page.dart';
import 'package:egtspt/resources/v2_update_schedule_gymer_page.dart';

import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

class DayListExcerciseGymer extends StatefulWidget {
  final DataWorkPT listExcerciseGymer;

  const DayListExcerciseGymer({super.key, required this.listExcerciseGymer});

  @override
  State<DayListExcerciseGymer> createState() => _DayListExcerciseGymerState();
}

class _DayListExcerciseGymerState extends State<DayListExcerciseGymer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'DANH SÁCH BÀI TẬP CỦA GYMER',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: (widget.listExcerciseGymer.excercises ?? []).isEmpty
          ? const Center(child: Text('Bạn chưa tạo bài tập'))
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: widget.listExcerciseGymer.excercises!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    flex: 10,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tên Bài Tập:  ${widget.listExcerciseGymer.excercises![index].name}",
                                            style: namePKStyle,
                                          ),
                                        ])),
                              ],
                            ),
                          ),
                        );
                      }),
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          V2UpdateScheduleGymerPage(
                                              idsession:
                                                  widget.listExcerciseGymer.id),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffcbb682)),
                              child: const Text("Chỉnh Sửa Lịch Tập"))),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SessionResultGymerPage(
                                      idsession: widget.listExcerciseGymer.id),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffcbb682)),
                          child: Text(
                            'Kết Quả bài tập',
                            style: namePKStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
