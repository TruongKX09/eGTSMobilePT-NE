import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';

import '../handler/show_feedback_pt_ne_handler.dart';

class ShowPTNEFeedBackPage extends StatefulWidget {
  const ShowPTNEFeedBackPage({
    super.key,
  });

  @override
  State<ShowPTNEFeedBackPage> createState() => _ShowPTNEFeedBackPageState();
}

class _ShowPTNEFeedBackPageState extends State<ShowPTNEFeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Đánh Giá Của Bạn',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: ShowPTNEFeedBackHandler().showPTNEFeedBack(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data!.code == 200) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.dataFeedBackPtne?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot
                                  .data!.dataFeedBackPtne![index].gymerName!,
                              style: nameExStyle,
                            ),
                            subtitle: Text(
                                '${snapshot.data!.dataFeedBackPtne![index].packageName} '),
                            leading: Text(
                                '${snapshot.data!.dataFeedBackPtne![index].rate} Sao'),
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
                                              'Tên Gói Tập: ${snapshot.data!.dataFeedBackPtne![index].packageName}',
                                              style: namePKStyle),
                                          Text(
                                              'Tên Gymer:${snapshot.data!.dataFeedBackPtne![index].gymerName!}'),
                                          Text(
                                              'Mức  Độ Hài Lòng: ${snapshot.data!.dataFeedBackPtne![index].rate} Sao',
                                              style: titleStyle),
                                          Text(
                                            "Đánh Giá: ${snapshot.data!.dataFeedBackPtne![index].feedback1}",
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
