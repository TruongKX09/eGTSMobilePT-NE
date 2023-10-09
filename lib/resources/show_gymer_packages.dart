import 'package:egtspt/common_data.dart';
import 'package:egtspt/models/list_gymer_accept_model.dart';
import 'package:egtspt/resources/create_body_parameter_page.dart';
import 'package:egtspt/resources/create_calandar_bypt.dart';
import 'package:egtspt/resources/show_package_feedback_page.dart';
import 'package:egtspt/resources/update_calendar_pt_page.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GymerPackagesScreen extends StatefulWidget {
  final DataGymerAccept dataListAccept;
  const GymerPackagesScreen({super.key, required this.dataListAccept});

  @override
  State<GymerPackagesScreen> createState() => _GymerPackagesScreenState();
}

class _GymerPackagesScreenState extends State<GymerPackagesScreen> {
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
            itemCount: widget.dataListAccept.gymerPackages!.length,
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
                                  "Tên Gói Tập:  ${widget.dataListAccept.gymerPackages![index].packageName}",
                                  style: namePKStyle,
                                ),
                                Text(
                                  widget.dataListAccept.gymerPackages![index]
                                              .numberOfSession ==
                                          null
                                      ? ""
                                      : "Số Buổi Tập: ${widget.dataListAccept.gymerPackages![index].numberOfSession.toString().toUpperCase()} buổi",
                                  style: titleStyle,
                                ),
                                Text(
                                  widget.dataListAccept.gymerPackages![index]
                                              .status ==
                                          null
                                      ? ""
                                      : "Trạng Thái Gói: ${widget.dataListAccept.gymerPackages![index].status.toString().toUpperCase()}",
                                  style: discountStyle,
                                ),
                                Text(
                                  "Thời Gian Bắt Đầu Gói:  ${DateFormat('dd/MM/yy').format(DateTime.parse(widget.dataListAccept.gymerPackages![index].from.toString()))}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AutofillHints.birthdayDay,
                                      fontSize: 12),
                                ),
                              ])),
                      (widget.dataListAccept.gymerPackages![index].status !=
                              "Tạm ngưng")
                          ? Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffcbb682),
                                    ),
                                    onPressed: () {
                                      String packageGymerID = widget
                                          .dataListAccept
                                          .gymerPackages![index]
                                          .packageGymerId
                                          .toString();
                                      CommonData()
                                          .setPackageGymerID(packageGymerID);

                                      String? status = widget.dataListAccept
                                          .gymerPackages![index].status;
                                      switch (status) {
                                        case "Đang hoạt động":
                                        case "Đang chờ":
                                          if (widget
                                              .dataListAccept
                                              .gymerPackages![index]
                                              .isUpdate!) {
                                            // Cập nhật lịch tập
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateCalendarByPT(
                                                  dataUpdate: widget
                                                      .dataListAccept
                                                      .gymerPackages![index],
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Tạo lịch tập
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateCalanderByPT(
                                                  dataListGymerCre: widget
                                                      .dataListAccept
                                                      .gymerPackages![index],
                                                ),
                                              ),
                                            );
                                          }
                                          break;
                                        case "Đã hoàn thành":
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowpackageFeedBackPage(
                                                      packageGymerID: widget
                                                          .dataListAccept
                                                          .gymerPackages![index]
                                                          .packageGymerId,
                                                    )),
                                          );
                                          break;

                                        default:
                                          // Không xử lý
                                          break;
                                      }
                                    },
                                    child: Text(widget.dataListAccept
                                                .gymerPackages![index].status ==
                                            "Đã hoàn thành"
                                        ? "Xem đánh giá"
                                        : widget
                                                    .dataListAccept
                                                    .gymerPackages![index]
                                                    .isUpdate! ==
                                                true
                                            ? "Tạo Lịch Chi Tiết "
                                            : "Tạo Lịch Tổng Quát"),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateBodyParameterPage(
                                                          gymerid: widget
                                                              .dataListAccept
                                                              .gymerId!),
                                                ));
                                          },
                                          child: Text(
                                            'Tỉ Lệ Cơ Thể',
                                            style: nameExStyle,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const Text('')
                    ],
                  ),
                ),
              );
            }));
  }
}
