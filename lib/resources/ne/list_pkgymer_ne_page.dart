import 'package:egtspt/common_data.dart';

import 'package:egtspt/models/ne/list_accept_ne_model.dart';

import 'package:egtspt/resources/ne/create_menu_ne_page.dart';
import 'package:egtspt/resources/ne/show_update_menu_gymer_page.dart';

import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListPKGymerNEPage extends StatefulWidget {
  final DataGymerAcceptNe dataListAcceptNE;
  const ListPKGymerNEPage({super.key, required this.dataListAcceptNE});

  @override
  State<ListPKGymerNEPage> createState() => _ListPKGymerNEPageState();
}

class _ListPKGymerNEPageState extends State<ListPKGymerNEPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'DANH SÁCH GÓI TẬP CỦA GYMER',
            style: appBarStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.dataListAcceptNE.gymerPackages!.length,
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
                          flex: 10,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tên Gói Tập:  ${widget.dataListAcceptNE.gymerPackages![index].packageName}",
                                  style: namePKStyle,
                                ),
                                Text(
                                  widget.dataListAcceptNE.gymerPackages![index]
                                              .numberOfSession ==
                                          null
                                      ? ""
                                      : "Số Buổi Tập: ${widget.dataListAcceptNE.gymerPackages![index].numberOfSession.toString().toUpperCase()} buổi",
                                  style: titleStyle,
                                ),
                                Text(
                                  widget.dataListAcceptNE.gymerPackages![index]
                                              .status ==
                                          null
                                      ? ""
                                      : "Trạng Thái Gói: ${widget.dataListAcceptNE.gymerPackages![index].status.toString().toUpperCase()}",
                                  style: discountStyle,
                                ),
                                Text(
                                  "Thời Gian Bắt Đầu Gói:  ${DateFormat('dd/MM/yy').format(DateTime.parse(widget.dataListAcceptNE.gymerPackages![index].from.toString()))}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AutofillHints.birthdayDay,
                                      fontSize: 12),
                                ),
                              ])),
                      Expanded(
                        flex: 6,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffcbb682),
                          ),
                          onPressed: () {
                            String packageGymerID = widget.dataListAcceptNE
                                .gymerPackages![index].packageGymerId
                                .toString();
                            CommonData().setPackageGymerID(packageGymerID);

                            String? status = widget
                                .dataListAcceptNE.gymerPackages![index].status;

                            switch (status) {
                              case "Đang hoạt động":
                              case "Đang chờ":
                                if (widget.dataListAcceptNE
                                    .gymerPackages![index].isUpdate!) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShowMenuByPackageGymerPage(
                                              dataNeCreateMenu: widget
                                                  .dataListAcceptNE
                                                  .gymerPackages![index],
                                            )),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateMenuGymer(
                                              dataNeCreateMenu: widget
                                                  .dataListAcceptNE
                                                  .gymerPackages![index],
                                            )),
                                  );
                                }
                                break;
                              case "Đã hoàn thành":
                                // Xem đánh giá
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ViewRating(
                                //       data: widget.gymerPackages[index],
                                //     ),
                                //   ),
                                // );
                                break;

                              default:
                                // Không xử lý
                                break;
                            }
                          },
                          child: Text(widget.dataListAcceptNE
                                      .gymerPackages![index].status ==
                                  "Đã hoàn thành"
                              ? "Xem đánh giá"
                              : widget.dataListAcceptNE.gymerPackages![index]
                                          .isUpdate! ==
                                      true
                                  ? "Cập nhật"
                                  : "Tạo Thực Đơn"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
