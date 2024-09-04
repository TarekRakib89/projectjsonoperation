import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectjson/components/custom_button.dart';
import 'package:projectjson/components/title_card.dart';

import 'android_verison.dart';
import 'common/app_style.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  late List<AndroidVerison> androidVersionList;

  @override
  void initState() {
    super.initState();
    androidVersionList = [];
    // redJsonData(2, jsonStringTwo);
  }

  static const jsonStringOne = '''
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

  static const jsonStringTwo = '''
  [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"}
    },
    {
      "0": {"id": 8, "title": "Froyo"},
      "2": {"id": 9, "title": "Éclair"},
      "3": {"id": 10, "title": "Donut"}
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"}
    ]
  ]
  ''';

  void redJsonData(int butNumber, String jsonString) {
    final jsonData = jsonDecode(jsonString);

    // Clear existing data if necessary
    androidVersionList.clear();

    if (butNumber == 1) {
      // Process jsonString1 format
      final firstItemOfList = jsonData[0] as Map<String, dynamic>;
      final secondItemOfList = jsonData[1] as List<dynamic>;

      firstItemOfList.forEach((key, value) {
        final item = value as Map<String, dynamic>;
        androidVersionList.add(AndroidVerison(
          id: item['id'],
          title: item['title'],
        ));
      });

      for (var item in secondItemOfList) {
        final mapItem = item as Map<String, dynamic>;
        androidVersionList.add(AndroidVerison(
          id: mapItem['id'],
          title: mapItem['title'],
        ));
      }
      setState(() {

      });
    } else if (butNumber == 2) {
      // Process jsonStringTwo format
      final firstItemOfList = jsonData[0] as Map<String, dynamic>;
      final secondItemOfList = jsonData[1] as Map<String, dynamic>;
      final thirdItemOfList = jsonData[2] as List<dynamic>;

      firstItemOfList.forEach((key, value) {
        final item = value as Map<String, dynamic>;
        androidVersionList.add(AndroidVerison(
          id: item['id'],
          title: item['title'],
        ));
      });

      secondItemOfList.forEach((key, value) {
        final item = value as Map<String, dynamic>;
        androidVersionList.add(AndroidVerison(
          id: item['id'],
          title: item['title'],
        ));
      });

      for (var item in thirdItemOfList) {
        final mapItem = item as Map<String, dynamic>;
        androidVersionList.add(AndroidVerison(
          id: mapItem['id'],
          title: mapItem['title'],
        ));
      }
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: kDark,
        title: Text("Title", style: appStyle(20, kWhite, FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(width: 150.w, height: 50.h, buttonText: "button one", ontap: (){
                    redJsonData(1, jsonStringOne);
                  }),
                  SizedBox(width: 20.w,),
                  CustomButton(width: 150.w, height: 50.h, buttonText: "button two", ontap: (){
                    redJsonData(2, jsonStringTwo);
                  }),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: androidVersionList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 6),
                    itemBuilder: (context, index){
                    var data = androidVersionList[index];
                    return TitleCard(androidVerison: data,);

                }),
              ),
            ],
          ),
        ),
      )
    );
  }
}
