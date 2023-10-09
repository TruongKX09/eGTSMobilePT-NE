import 'package:egtspt/common_data.dart';

import 'package:egtspt/resources/ne/list_pkgymer_ne_page.dart';
import 'package:egtspt/resources/ne/shedule_excercise_gymer_page.dart';

import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../../handler/ne/list_accept_ne_handler.dart';
import '../../untils/theme.dart';

class GymerAcceptNEPage extends StatefulWidget {
  const GymerAcceptNEPage({super.key});

  @override
  State<StatefulWidget> createState() => _GymerAcceptNEPageState();
}

class _GymerAcceptNEPageState extends State<GymerAcceptNEPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('DANH SÁCH GYMER CỦA BẠN')),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: FutureBuilder(
            future: ListGymerAcceptNEHandler().onFetchListGymerAcceptNE(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data!.dataGymerAcceptNeList == null) {
                  return const Center(
                    child: Text('Chưa có DS Gymer'),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.dataGymerAcceptNeList?.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListPKGymerNEPage(
                                          dataListAcceptNE: snapshot.data!
                                              .dataGymerAcceptNeList![index],
                                        )),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Tên Gymer: \n${snapshot.data!.dataGymerAcceptNeList![index].gymerName.toString().toUpperCase()}",
                                        style: namePKStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ZIMKitMessageListPage(
                                                  conversationID: snapshot
                                                      .data!
                                                      .dataGymerAcceptNeList![
                                                          index]
                                                      .gymerId!
                                                      .trim()
                                                      .replaceAll(r'-', ''),
                                                  conversationType:
                                                      ZIMConversationType.peer,
                                                  appBarBuilder:
                                                      (BuildContext context,
                                                          AppBar appBar) {
                                                    return AppBar(
                                                        title: Text(snapshot
                                                            .data!
                                                            .dataGymerAcceptNeList![
                                                                index]
                                                            .gymerName!));
                                                  },
                                                ),
                                              ));
                                        },
                                        icon: const Icon(
                                          Icons.message,
                                          color: Colors.green,
                                          size: 35,
                                        ))),
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffcbb682),
                                    ),
                                    onPressed: () {
                                      String gymerAcceptID = snapshot.data!
                                          .dataGymerAcceptNeList![index].gymerId
                                          .toString();
                                      CommonData()
                                          .setGymerAcceptID(gymerAcceptID);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ShowNESchedulePage(),
                                          ));
                                    },
                                    child: const Text('Lịch Tập'),
                                  ),
                                ),
                                const SizedBox(width: 2),
                              ],
                            ),
                          ),
                        ));
                      });
                }
              }
            }));
  }
}
