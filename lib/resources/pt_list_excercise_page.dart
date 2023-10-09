import 'package:egtspt/handler/list_excercise_handler.dart';
import 'package:egtspt/untils/theme.dart';

import 'package:flutter/material.dart';

import '../common_data.dart';
import 'create_excercise_page.dart';
import 'detail_excercise_pt_page.dart';

class PTExcercisePage extends StatefulWidget {
  const PTExcercisePage({super.key});

  @override
  State<PTExcercisePage> createState() => _PTExcercisePageState();
}

class _PTExcercisePageState extends State<PTExcercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'DANH SÁCH BÀI TẬP',
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
                      labelText: 'Tìm kiếm Bài Tập',
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
                          builder: (context) => const CreateExcercisePage()),
                    );
                  },
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: ListExcerciseHandler().onFetchListExcercise(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data!.code == 200) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.dataExcercisePTs?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data!.dataExcercisePTs![index].name!,
                              style: nameExStyle,
                            ),
                            subtitle: Text(
                                '${snapshot.data!.dataExcercisePTs![index].calorieCumsumption} Calories'),
                            leading: Text(
                                '${snapshot.data!.dataExcercisePTs![index].repTime} ${snapshot.data!.dataExcercisePTs![index].unitOfMeasurement}'),
                            trailing: TextButton(
                              child: Text(
                                'Chi tiết',
                                style: namePKStyle,
                              ),
                              onPressed: () {
                                String excerciseID = snapshot
                                    .data!.dataExcercisePTs![index].id
                                    .toString();
                                CommonData().setExcerciseID(excerciseID);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailExcercisePTPage(
                                            dataExcercisePt: snapshot
                                                .data!.dataExcercisePTs![index],
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
                        "Bạn Chưa Tạo Bài Tập!",
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
