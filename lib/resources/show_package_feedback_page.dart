import 'package:egtspt/handler/show_package_feedback_handler.dart';

import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';

class ShowpackageFeedBackPage extends StatefulWidget {
  final String? packageGymerID;
  const ShowpackageFeedBackPage({
    super.key,
    required this.packageGymerID,
  });

  @override
  State<ShowpackageFeedBackPage> createState() =>
      _ShowpackageFeedBackPageState();
}

class _ShowpackageFeedBackPageState extends State<ShowpackageFeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Đánh Giá Gói Tập',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: ShowPackageFeedBackHandler()
                  .showPackageFeedBack(widget.packageGymerID),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data!.code == 200) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.dataPackageFeedBack?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot
                                  .data!.dataPackageFeedBack![index].gymerName!,
                              style: nameExStyle,
                            ),
                            subtitle: Text(
                                '${snapshot.data!.dataPackageFeedBack![index].packageName} '),
                            leading: Text(
                                '${snapshot.data!.dataPackageFeedBack![index].rate} Sao'),
                            trailing: TextButton(
                              child: Text(
                                'Chi tiết',
                                style: namePKStyle,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Thông tin chi tiết',
                                        style: totalStyle,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Tên Gói Tập: ${snapshot.data!.dataPackageFeedBack![index].packageName}',
                                              style: namePKStyle),
                                          Text(
                                              'Tên Gymer:${snapshot.data!.dataPackageFeedBack![index].gymerName!}'),
                                          Text(
                                              'Mức  Độ Hài Lòng: ${snapshot.data!.dataPackageFeedBack![index].rate} Sao',
                                              style: titleStyle),
                                          Text(
                                            "Đánh Giá: ${snapshot.data!.dataPackageFeedBack![index].feedback1}",
                                            style: titleStyle,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Gói tập chưa có đánh giá!",
                        style: appBarStyle,
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
