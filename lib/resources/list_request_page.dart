import 'package:egtspt/common_data.dart';
import 'package:egtspt/handler/list_request_handler.dart';

import 'package:egtspt/resources/goal_gymer_page.dart';
import 'package:flutter/material.dart';

import '../untils/theme.dart';

class ListRequestPage extends StatefulWidget {
  const ListRequestPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListRequestPageState();
}

class _ListRequestPageState extends State<ListRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'DANH SÁCH YÊU CẦU CỦA BẠN',
            style: appBarStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: FutureBuilder(
            future: ListRequestHandler().onFetchListRequest(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data?.code == 200) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.dataRequests?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "Tên Gói Tập:  ${snapshot.data!.dataRequests![index].packageGymerName.toString().toUpperCase()}",
                                          style: namePKStyle),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tên Gymer:  ${snapshot.data!.dataRequests![index].gymerName.toString()}",
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data!.dataRequests![index]
                                                    .numberOfSession ==
                                                null
                                            ? ""
                                            : "Số Buổi Tập: ${snapshot.data!.dataRequests![index].numberOfSession.toString().toUpperCase()} buổi",
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffcbb682),
                                    ),
                                    onPressed: () {
                                      String requestID = snapshot
                                          .data!.dataRequests![index].id
                                          .toString();
                                      CommonData().setRequestID(requestID);

                                      String gymerID = snapshot
                                          .data!.dataRequests![index].gymerId
                                          .toString();
                                      CommonData().setGymerID(gymerID);

                                      // String pgID = snapshot
                                      //     .data!.data![index].id!
                                      //     .toString();
                                      // CommonData().setPGID(pgID);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GoalGymerPage()),
                                      );
                                    },
                                    child: const Text('Chi Tiết'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "Không có yêu cầu!",
                      style: appBarStyle,
                    ),
                  );
                }
              }
            }));
  }
}
