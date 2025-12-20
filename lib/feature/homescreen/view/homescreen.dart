import 'package:flutter/material.dart';
import 'package:travel_planner/feature/homescreen/view/widget/buttongeneratetrip.dart';
import 'package:travel_planner/feature/homescreen/view/widget/buttongotomytrip.dart';
import 'package:travel_planner/feature/homescreen/view/widget/contenthome.dart';
import 'package:travel_planner/feature/homescreen/view/widget/homescreenlistener.dart';
import 'package:travel_planner/feature/homescreen/view/widget/tophome.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: .center,
        children: [
          Stack(
            children: [
              TopHome(),
              ContentHome(),
              ButtonGenerateTrip(),
              ButtonGoToMyTrip(),
            ],
          ),
          Homescreenlistener(),
        ],
      ),
    );
  }
}
