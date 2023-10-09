import 'package:egtspt/api/body_parameter_api.dart';

import 'package:egtspt/handler/goal_gymer_handler.dart';

import 'package:flutter/material.dart';

class BodyParameterPage extends StatefulWidget {
  const BodyParameterPage({super.key});

  @override
  State<StatefulWidget> createState() => _BodyParameterPageState();
}

class _BodyParameterPageState extends State<BodyParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Chỉ Số Cơ Thể Khách Hàng')),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: FutureBuilder(
            future: GoalGymerHandler().onFetchGoalGymer(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // itemCount: ,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Mục Tiêu:  ${snapshot.data!.dataGoalGymer!.goal.toString().toUpperCase()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Cân Nặng:  ${snapshot.data!.dataGoalGymer!.weight.toString().toUpperCase()} kg",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Chiều Cao:  ${snapshot.data!.dataGoalGymer!.height.toString().toUpperCase()} cm",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Chỉ Số BMI:  ${snapshot.data!.dataGoalGymer!.bmi!.toStringAsFixed(3).toUpperCase()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          (snapshot.data!.dataGoalGymer!.bone != null)
                              ? Text(
                                  "Phần Trăm Xương:  ${snapshot.data!.dataGoalGymer!.bone.toString().toUpperCase()}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              : const Text(
                                  "Phần Trăm Xương:  Chưa ghi nhận",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          (snapshot.data!.dataGoalGymer!.fat != null)
                              ? Text(
                                  "Phần Trăm Mỡ:  ${snapshot.data!.dataGoalGymer!.fat.toString().toUpperCase()}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              : const Text(
                                  "Phần Trăm Mỡ:  Chưa ghi nhận",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          (snapshot.data!.dataGoalGymer!.muscle != null)
                              ? Text(
                                  "Phần Trăm Cơ:  ${snapshot.data!.dataGoalGymer!.muscle.toString().toUpperCase()}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              : const Text(
                                  "Phần Trăm Cơ:  Chưa ghi nhận",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                          const SizedBox(height: 40),
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
                                  BodyParameterAPI()
                                      .updateRequestPT(context, true);
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                child: const Text('Đồng Ý',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
            }));
  }
}
