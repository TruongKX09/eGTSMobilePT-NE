import 'package:egtspt/resources/detail_excercise_pt_page.dart';
import 'package:flutter/material.dart';

import '../common_data.dart';
import '../handler/list_excercise_handler.dart';
import '../models/list_excercise_model.dart';
import '../untils/theme.dart';
import 'create_excercise_page.dart';

class ListExcercisePage extends StatefulWidget {
  final List<DataExcercisePt>? alreadySel;
  const ListExcercisePage({super.key, this.alreadySel});

  @override
  State<ListExcercisePage> createState() => _ListExcercisePageState();
}

class _ListExcercisePageState extends State<ListExcercisePage> {
  List<DataExcercisePt> selExercises = [];
  List<String> selID = [];
  bool isSel = false;
  @override
  void initState() {
    if (widget.alreadySel != []) {
      selExercises = widget.alreadySel!;
      for (var element in widget.alreadySel!) {
        selID.add(element.id!);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Center(
              child: Text(
            'DANH SÁCH BÀI TẬP',
            style: appBarStyle,
          )),
          backgroundColor: themeCol,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selID.isNotEmpty
            ? SizedBox(
                height: 36,
                width: 100,
                child: FloatingActionButton(
                  backgroundColor: themeCol,
                  splashColor: themeCol.withBlue(100),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  onPressed: () {
                    Navigator.pop(context, selExercises);
                  },
                  child: const Icon(Icons.done_outline_rounded),
                ),
              )
            : null,
        body: FutureBuilder(
            future: ListExcerciseHandler().onFetchListExcercise(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data!.code == 200) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.dataExcercisePTs?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (selID.contains(
                                snapshot.data!.dataExcercisePTs![index].id)) {
                              selExercises.removeWhere((element) =>
                                  element.id ==
                                  snapshot.data!.dataExcercisePTs![index].id);
                              selID.remove(
                                  snapshot.data!.dataExcercisePTs![index].id!);
                            } else {
                              selID.add(
                                  snapshot.data!.dataExcercisePTs![index].id!);
                              selExercises
                                  .add(snapshot.data!.dataExcercisePTs![index]);
                            }
                            setState(() {});
                          },
                          child: Card(
                            shape: selExercises.contains(
                                    snapshot.data!.dataExcercisePTs![index])
                                ? const RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.green))
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: selID.contains(snapshot
                                        .data!.dataExcercisePTs![index].id),
                                    activeColor: themeCol,
                                    onChanged: (bool? value) {},
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Tên Bài Tập: ${snapshot.data!.dataExcercisePTs![index].name.toString().toUpperCase()}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Năng Lượng: ${snapshot.data!.dataExcercisePTs![index].calorieCumsumption} Calories",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Số Lượng: ${snapshot.data!.dataExcercisePTs![index].repTime} ${snapshot.data!.dataExcercisePTs![index].unitOfMeasurement}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffcbb682),
                                      ),
                                      onPressed: () {
                                        String excerciseID = snapshot
                                            .data!.dataExcercisePTs![index].id
                                            .toString();
                                        CommonData()
                                            .setExcerciseID(excerciseID);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailExcercisePTPage(
                                                      dataExcercisePt: snapshot
                                                              .data!
                                                              .dataExcercisePTs![
                                                          index])),
                                        );
                                      },
                                      child: const Text('Chi Tiết'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "Bạn Chưa Tạo Bài Tập!",
                      style: appBarStyle,
                    ),
                  );
                }
              }
            }));
  }
}
