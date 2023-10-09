import 'package:egtspt/api/body_parameter_api.dart';

import 'package:egtspt/handler/goal_gymer_handler.dart';
import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';

class GoalGymerPage extends StatefulWidget {
  const GoalGymerPage({super.key});

  @override
  State<GoalGymerPage> createState() => _DetailExcercisePTPageState();
}

class _DetailExcercisePTPageState extends State<GoalGymerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Thông Tin Khách Hàng',
            style: namePKStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: FutureBuilder(
            future: GoalGymerHandler().onFetchGoalGymer(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Card(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52,
                            width: 350,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Mục Tiêu: ${snapshot.data!.dataGoalGymer!.goal}',
                                style: namePKStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52,
                            width: 350,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Cân Nặng: ${snapshot.data!.dataGoalGymer!.weight} ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52,
                            width: 350,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Chiều Cao: ${snapshot.data!.dataGoalGymer!.height} Cm ",
                                style: nameExStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52,
                            width: 350,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Chỉ số BMI: ${snapshot.data!.dataGoalGymer!.bmi!.toStringAsFixed(3).toUpperCase()}  ",
                                style: nameExStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       height: 52,
                      //       width: 350,
                      //       margin: const EdgeInsets.symmetric(horizontal: 16),
                      //       padding: const EdgeInsets.symmetric(horizontal: 14),
                      //       decoration: BoxDecoration(
                      //           border:
                      //               Border.all(color: Colors.grey, width: 1.0),
                      //           borderRadius: BorderRadius.circular(12)),
                      //       child: Center(
                      //         child:
                      //             (snapshot.data!.dataGoalGymer!.bone != null)
                      //                 ? Text(
                      //                     "Phần Trăm Xương: ${snapshot.data!.dataGoalGymer!.bone} % ",
                      //                     style: nameExStyle,
                      //                   )
                      //                 : const Text(
                      //                     "Phần Trăm Xương:  Chưa ghi nhận",
                      //                     style: TextStyle(
                      //                         fontWeight: FontWeight.normal,
                      //                         fontSize: 16),
                      //                   ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       height: 52,
                      //       width: 350,
                      //       margin: const EdgeInsets.symmetric(horizontal: 16),
                      //       padding: const EdgeInsets.symmetric(horizontal: 14),
                      //       decoration: BoxDecoration(
                      //           border:
                      //               Border.all(color: Colors.grey, width: 1.0),
                      //           borderRadius: BorderRadius.circular(12)),
                      //       child: Center(
                      //         child:
                      //             (snapshot.data!.dataGoalGymer!.bone != null)
                      //                 ? Text(
                      //                     "Phần Trăm Mỡ: ${snapshot.data!.dataGoalGymer!.fat} % ",
                      //                     style: nameExStyle,
                      //                   )
                      //                 : const Text(
                      //                     "Phần Trăm Mỡ:  Chưa ghi nhận",
                      //                     style: TextStyle(
                      //                         fontWeight: FontWeight.normal,
                      //                         fontSize: 16),
                      //                   ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       height: 52,
                      //       width: 350,
                      //       margin: const EdgeInsets.symmetric(horizontal: 16),
                      //       padding: const EdgeInsets.symmetric(horizontal: 14),
                      //       decoration: BoxDecoration(
                      //           border:
                      //               Border.all(color: Colors.grey, width: 1.0),
                      //           borderRadius: BorderRadius.circular(12)),
                      //       child: Center(
                      //         child:
                      //             (snapshot.data!.dataGoalGymer!.bone != null)
                      //                 ? Text(
                      //                     "Phần Trăm Cơ: ${snapshot.data!.dataGoalGymer!.muscle} % ",
                      //                     style: nameExStyle,
                      //                   )
                      //                 : const Text(
                      //                     "Phần Trăm Cơ:  Chưa ghi nhận",
                      //                     style: TextStyle(
                      //                         fontWeight: FontWeight.normal,
                      //                         fontSize: 16),
                      //                   ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              BodyParameterAPI()
                                  .updateRequestPT(context, false);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey)),
                            child: const Text('Từ chối',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          TextButton(
                            onPressed: () {
                              BodyParameterAPI().updateRequestPT(context, true);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            child: const Text('Đồng Ý',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
