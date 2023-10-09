import 'package:egtspt/handler/ne/list_food_ne_handler.dart';
import 'package:egtspt/models/ne/list_food_ne_model.dart';
import 'package:egtspt/resources/ne/create_food_page.dart';
import 'package:egtspt/resources/ne/detail_food_ne.dart';
import 'package:egtspt/untils/theme.dart';
import 'package:flutter/material.dart';

class V2HomeFoodListPage extends StatefulWidget {
  const V2HomeFoodListPage({super.key});

  @override
  State<V2HomeFoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<V2HomeFoodListPage> {
  List<DataFood>? listLunch = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateFoodPage()),
                    );
                  },
                  label: const Text('Tạo Thực Phẩm Mới'),
                  icon: const Icon(Icons.add_circle_sharp),
                  backgroundColor: const Color(0xffcbb682),
                  tooltip: 'Tạo thực phẩm mới',
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
                  if (snapshot.data!.code == 200) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.dataFoods?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data!.dataFoods![index].name!,
                              style: namePKStyle,
                            ),
                            subtitle: Text(
                                '${snapshot.data!.dataFoods![index].calories} Calories'),
                            leading: Text(
                                '${snapshot.data!.dataFoods![index].ammount} ${snapshot.data!.dataFoods![index].unitOfMesuament}'),
                            trailing: TextButton(
                              child: Text(
                                'Chi tiết',
                                style: namePKStyle,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailFoodNEPage(
                                            dataFoodNE: snapshot
                                                .data!.dataFoods![index],
                                          )),
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
        ],
      ),
    );
  }
}
