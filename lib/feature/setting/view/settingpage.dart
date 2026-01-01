import 'package:flutter/material.dart';
import 'package:travel_planner/feature/setting/view/widget/cardaboutus.dart';
import 'package:travel_planner/feature/setting/view/widget/cardlogout.dart';
import 'package:travel_planner/feature/setting/view/widget/cardmypreference.dart';
import 'package:travel_planner/feature/setting/view/widget/cardmyprofile.dart';
import 'package:travel_planner/feature/setting/view/widget/cardreport.dart';
import 'package:travel_planner/feature/setting/view/widget/topsetting.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      body: ListView(
        children: [
          TopSetting(),

          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                CardMyProfile(),
                CardMyPreference(),
                CardAboutUs(),
                CardReport(),
                CardLogout(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
