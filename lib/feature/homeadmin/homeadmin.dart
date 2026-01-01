import 'package:flutter/material.dart';

import 'package:travel_planner/feature/homeadmin/widget/buttomnavbaradmin.dart';
import 'package:travel_planner/feature/settingadmin/settingadmin.dart';
import 'package:travel_planner/feature/useradmin/view/useradminpage.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeAdmin> {
  int currentIndex = 0;

  final List<Widget> pages = [UserAdminpage(), SettingAdmin()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: buildCustomBottomNavBarAdmin(context, currentIndex, (
        index,
      ) {
        setState(() {
          currentIndex = index;
        });
      }),
    );
  }
}
