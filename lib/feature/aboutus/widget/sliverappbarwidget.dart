import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.green.shade900,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(Imagesconst.home3, fit: BoxFit.cover),
            Container(color: Colors.black12),
          ],
        ),
      ),
    );
  }
}
