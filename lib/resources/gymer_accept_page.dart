import 'package:egtspt/common_data.dart';
import 'package:egtspt/handler/gymer_accept_handler.dart';

import 'package:egtspt/resources/show_gymer_menu_page.dart';

import 'package:egtspt/resources/show_gymer_packages.dart';
import 'package:egtspt/resources/videocallandchat/common.dart';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:zego_zimkit/pages/message_list_page.dart';
import 'package:zego_zimkit/services/services.dart';

import '../untils/theme.dart';

class GymerAcceptPage extends StatefulWidget {
  const GymerAcceptPage({super.key});

  @override
  State<StatefulWidget> createState() => _GymerAcceptPageState();
}

class _GymerAcceptPageState extends State<GymerAcceptPage> {
  TextEditingController ivtUserIdCtl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'DANH SÁCH GYMER CỦA BẠN',
            style: appBarStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: FutureBuilder(
              future: ListGymerAcceptHandler().onFetchListGymerAccept(),
              builder: (context, snapshot) {
                //load du lieu xoay vong
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  //tra ra null thi show empty
                  if (snapshot.data!.dataGymerAccepts == null) {
                    return Center(
                      child: Text(
                        'Chưa có DS Gymer',
                        style: namePKStyle,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.dataGymerAccepts?.length,
                        itemBuilder: (context, index1) {
                          ivtUserIdCtl.text =
                              snapshot.data!.dataGymerAccepts![index1].gymerId!;
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: InkWell(
                                onTap: () {
                                  String gymerAcceptID = snapshot
                                      .data!.dataGymerAccepts![index1].gymerId
                                      .toString();
                                  CommonData().setGymerAcceptID(gymerAcceptID);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GymerPackagesScreen(
                                          dataListAccept: snapshot
                                              .data!.dataGymerAccepts![index1]),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tên Gymer:  \n${snapshot.data!.dataGymerAccepts![index1].gymerName.toString().toUpperCase()}",
                                            style: namePKStyle,
                                          ),
                                        ],
                                      ),
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
                                                          .dataGymerAccepts![
                                                              index1]
                                                          .gymerId!
                                                          .trim()
                                                          .replaceAll(r'-', ''),
                                                      conversationType:
                                                          ZIMConversationType
                                                              .peer,
                                                      appBarBuilder:
                                                          (BuildContext context,
                                                              AppBar appBar) {
                                                        return AppBar(
                                                            title: Text(snapshot
                                                                .data!
                                                                .dataGymerAccepts![
                                                                    index1]
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
                                      child: sendCallButton(
                                        isVideoCall: true,
                                        inviteID: snapshot.data!
                                            .dataGymerAccepts![index1].gymerId!,
                                        inviteName: snapshot
                                                .data!
                                                .dataGymerAccepts![index1]
                                                .gymerName ??
                                            "",
                                        onCallFinished:
                                            onSendCallInvitationFinished,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffcbb682),
                                        ),
                                        onPressed: () {
                                          String gymerAcceptID = snapshot.data!
                                              .dataGymerAccepts![index1].gymerId
                                              .toString();
                                          CommonData()
                                              .setGymerAcceptID(gymerAcceptID);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ShowMenuGymerPage(),
                                              ));
                                        },
                                        child: const Text('Thực Đơn'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }
              }),
        ));
  }

  void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    if (errorInvitees.isNotEmpty) {
      var userIDs = '';
      for (var index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        final userID = errorInvitees.elementAt(index);
        userIDs += '$userID ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = "Nguời dùng đa: $userIDs";
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      showToast(
        message,
        position: StyledToastPosition.top,
        context: context,
      );
    } else if (code.isNotEmpty) {
      showToast(
        'Người dùng hiện tại không online',
        position: StyledToastPosition.top,
        context: context,
      );
    }
  }
}
