import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'android_verison.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {

  late AndroidVerison androidVersion;
  late List<AndroidVerison> androidVersionList;

  @override
  void initState() {

    super.initState();
    redJsonData(2,jsonStringTwo);
  }
  static const jsonString1 = '''
  [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"}
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"}
    ]
  ]
  ''';
  static const jsonStringTwo  = '''
 [
    {
      "0":{"id":1,"title":"Gingerbread"},
      "1":{"id":2,"title":"Jellybean"},
      "3":{"id":3,"title":"KitKat"}
     },
     {
       "0":{"id":8,"title":"Froyo"},
       "2":{"id":9,"title":"Éclair"},
       "3":{"id":10,"title":"Donut"}
     },
     [
       {"id":4,"title":"Lollipop"},
       {"id":5,"title":"Pie"},
       {"id":6,"title":"Oreo"},
       {"id":7,"title":"Nougat"}
      ]
    ] ''';

  List firstIndex = ["0","1","3"];
  List secondIndex = ["0","2","3"];


  redJsonData(int butNumber, var jsonString) {
    androidVersionList = [];
    List<dynamic> jsonData = jsonDecode(jsonString);

    if (butNumber == 1){
      for (int i = 0; i < jsonData.length; i++) {
        Map<String, dynamic> firstItemOfList = jsonData[0];
        List<dynamic> secondItemOfList = jsonData[1];

        for (int j = 0; j < firstItemOfList.length; j++) {
          androidVersionList.add(AndroidVerison(id: firstItemOfList[firstIndex[j]]["id"],
              title: firstItemOfList[firstIndex[j]]['title']));
        }
        for (int k = 0; k < secondItemOfList.length; k++) {
          androidVersionList.add(AndroidVerison(
              id: secondItemOfList[k]["id"], title: secondItemOfList[k]['title']));
        }
      }
  }

    if(butNumber==2){
      androidVersionList = [];

        Map<String, dynamic> firstItemOfList = jsonData[0];
        Map<String, dynamic> secondItemOfList = jsonData[1];
        List<dynamic> thirdItemOfList = jsonData[2];


        for (int j = 0; j < firstItemOfList.length; j++) {
          androidVersionList.add(AndroidVerison(id: firstItemOfList[firstIndex[j]]["id"],
              title: firstItemOfList[firstIndex[j]]['title']));
        }
        for (int j = 0; j < firstItemOfList.length; j++) {
          androidVersionList.add(AndroidVerison(id: secondItemOfList[secondIndex[j]]["id"],
              title: secondItemOfList[secondIndex[j]]['title']));
        }
        for (int k = 0; k < thirdItemOfList.length; k++) {
          androidVersionList.add(AndroidVerison(
              id: thirdItemOfList[k]["id"], title: thirdItemOfList[k]['title']));
        }

      }



    // if (butNumber == 2){
    //   for (int i = 0; i < jsonData.length; i++) {
    //     Map<String, dynamic> firstItemOfList = jsonData[0];
    //     Map<String, dynamic> secondItemOfList = jsonData[1];
    //     List<dynamic> ThirdItemOfList = jsonData[2];
    //     for (int j = 0; j < firstItemOfList.length; j++) {
    //       androidVerisonList.add(AndroidVerison(id: firstItemOfList[firstIndex[j]]["id"],
    //           title: firstItemOfList[firstIndex[j]]['title']));
    //     }
    //     for (int k = 0; k < secondItemOfList.length; k++) {
    //       androidVerisonList.add(AndroidVerison(
    //           id: secondItemOfList[secondIndex[k]["id"]], title: secondItemOfList[secondIndex[k]]['title']));
    //     }
    //   }
    // }
  }
  // final jsonData = jsonDecode(jsonString);
// Extract and process the first part (object)
 



  @override
  Widget build(BuildContext context) {
    // print(jsonData[0]['0']["title"]);

    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
            itemCount: androidVersionList.length,
            itemBuilder: (context, index){
          var data = androidVersionList[index];
          return Center(
            child: Container(
              child: Text(data.title.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

            ),
          );
        }),
      )
    );
  }


}
