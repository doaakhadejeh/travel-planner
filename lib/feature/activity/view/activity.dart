import 'package:flutter/material.dart';
import 'package:travel_planner/feature/activity/view/widget/activitylistener.dart';
import 'package:travel_planner/feature/activity/view/widget/blocbuilderactivity.dart';
import 'package:travel_planner/feature/activity/view/widget/topactivity.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Topactivity(), Blocbuilderactivity(), Activitylistener()],
      ),
    );
  }
}
