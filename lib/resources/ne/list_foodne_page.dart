import 'package:egtspt/handler/ne/list_food_ne_handler.dart';
import 'package:egtspt/models/ne/list_food_ne_model.dart';
import 'package:egtspt/resources/ne/create_food_page.dart';
import 'package:flutter/material.dart';

import '../../untils/theme.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<String> isCheck = [];
  List<DataFood>? resList = [];
  List<DataFood>? listLunch = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'DANH SÁCH THỰC PHẨM ',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Tìm kiếm thực phẩm',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_sharp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateFoodPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: ListFoodNEHandler().onFetchListRequest(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data?.code == 200 &&
                      snapshot.data!.dataFoods != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.dataFoods?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Checkbox(
                              value: isCheck.contains(
                                  snapshot.data?.dataFoods![index].id),
                              onChanged: (value) {
                                if (isCheck.contains(
                                    snapshot.data?.dataFoods![index].id)) {
                                  resList!.removeWhere((element) =>
                                      element.id ==
                                      snapshot.data?.dataFoods![index].id);
                                  isCheck.removeWhere((element) =>
                                      element ==
                                      snapshot.data?.dataFoods![index].id);
                                } else {
                                  resList!
                                      .add(snapshot.data!.dataFoods![index]);
                                  isCheck.add(
                                      snapshot.data!.dataFoods![index].id!);
                                }
                                setState(() {});
                              },
                            ),
                            title: Text(snapshot.data!.dataFoods![index].name!),
                            subtitle: Text(
                                '${snapshot.data!.dataFoods![index].ammount} ${snapshot.data!.dataFoods![index].unitOfMesuament}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('XÁC NHẬN'),
                                      content: const Text(
                                          'Bạn chắc chắn xóa thực phẩm này?'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey),
                                          child: const Text('Hủy Bỏ'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              //foods.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xffcbb682)),
                                          child: const Text('Xác Nhận'),
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
                        "Bạn Chưa Tạo Thực Phẩm!",
                        style: appBarStyle,
                      ),
                    );
                  }
                }
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
            child: SizedBox(
              width: 200,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffcbb682),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
                onPressed: () {
                  Navigator.pop(context, resList);
                },
                child: const Text(
                  'Thêm Thực Phẩm',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Food {
  String name;
  int amount;
  String unit;
  int calories;
  bool isChecked = false;

  Food(this.name, this.amount, this.unit, this.calories);
}
