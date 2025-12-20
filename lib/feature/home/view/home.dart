import 'package:flutter/material.dart';
import 'package:travel_planner/feature/favourite/view/favouritepage.dart';
import 'package:travel_planner/feature/home/view/widget/buttomnavbar.dart';
import 'package:travel_planner/feature/homescreen/view/homescreenpage.dart';
import 'package:travel_planner/feature/setting/view/settingpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [HomescreenPage(), FavoritePage(), Settingpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: buildCustomBottomNavBar(context, currentIndex, (
        index,
      ) {
        setState(() {
          currentIndex = index;
        });
      }),
    );
  }
}
