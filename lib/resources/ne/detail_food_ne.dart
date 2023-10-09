import 'package:egtspt/models/ne/list_food_ne_model.dart';
import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';

class DetailFoodNEPage extends StatefulWidget {
  final DataFood dataFoodNE;
  const DetailFoodNEPage({super.key, required this.dataFoodNE});

  @override
  State<DetailFoodNEPage> createState() => _DetailFoodNEPageState();
}

class _DetailFoodNEPageState extends State<DetailFoodNEPage> {
  TextEditingController newCalorieCumsumptionController =
      TextEditingController();
  TextEditingController newamount = TextEditingController();
  TextEditingController newunitOfMeasurement = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    newCalorieCumsumptionController.text =
        widget.dataFoodNE.calories.toString();
    newamount.text = widget.dataFoodNE.ammount.toString();
    newunitOfMeasurement.text = widget.dataFoodNE.unitOfMesuament.toString();

    isEditing = false;
  }

  bool isVideoUrl(url) {
    return url.toString().contains("http");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Chi Tiết Thực Phẩm',
          style: namePKStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 52,
                  width: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Tên Món: ${widget.dataFoodNE.name}',
                      style: namePKStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (!isEditing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Khối Lượng: ${widget.dataFoodNE.ammount} ${widget.dataFoodNE.unitOfMesuament}",
                        style: titleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (isEditing) ...[
              const Text("Khối Lượng"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: newamount,
                        decoration: const InputDecoration(
                          hintText: 'Khối Lượng',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Đơn Vị Tính"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: newunitOfMeasurement,
                        decoration: const InputDecoration(
                          hintText: 'Đơn vị Tính',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            if (!isEditing) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Năng Lượng Cung Cấp: ${widget.dataFoodNE.calories} Calories ",
                        style: nameExStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 5),
            if (isEditing) ...[
              const Text("Năng Lượng Cung Cấp"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        // Kết nối với TextEditingController
                        controller: newCalorieCumsumptionController,
                        decoration: const InputDecoration(
                          hintText: 'Năng Lượng Cung Cấp',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Hiển thị dialog xác nhận xóa
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Xác nhận xóa',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Thực phẩm sẽ không thể phục hồi. Bạn chắc chắn xóa?',
                              style: titleStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Huỷ dialog
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Huỷ'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // UpdateExcercisePT().deleteExcercisePT(
                                  //     context, widget.dataExcercisePt.id);
                                },
                                child: const Text(
                                  'Xác nhận',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    label: const Text('Xóa'),
                    icon: const Icon(Icons.delete),
                    backgroundColor: Colors.blueGrey,
                    tooltip: 'Delete',
                  ),
                ),
                const Spacer(),
                if (!isEditing) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      label: const Text('Chỉnh sửa'),
                      icon: const Icon(Icons.edit),
                      backgroundColor: const Color(0xffcbb682),
                      tooltip: 'Chỉnh sửa',
                    ),
                  ),
                ],
                // Nút "Save"
                if (isEditing) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Hiển thị dialog xác nhận thay đổi
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Xác nhận thay đổi'),
                              content: const Text(
                                  'Bạn có chắc chắn muốn lưu thay đổi?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Huỷ dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Huỷ'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // UpdateExcercisePT().updateExcercisePT(
                                    //     context,
                                    //     widget.dataExcercisePt.id,
                                    //     newdescription.text,
                                    //     widget.dataExcercisePt.video,
                                    //     newCalorieCumsumptionController.text,
                                    //     newrepTime.text,
                                    //     newunitOfMeasurement.text);
                                  },
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      label: const Text('Lưu'),
                      icon: const Icon(Icons.save),
                      backgroundColor: const Color(0xffcbb682),
                      tooltip: 'Save',
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
