import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavBarAdmin(
  BuildContext context,
  int currentIndex,
  Function(int) onTap,
) {
  return Container(
    color: Colors.transparent,

    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: BottomNavigationBar(
        backgroundColor: Colors.green.shade900,
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedFontSize: 10.sp,
        unselectedItemColor: Colors.green.shade200,
        selectedFontSize: 15.sp,
        selectedItemColor: Colors.green.shade50,
        type: BottomNavigationBarType.fixed,
        elevation: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    ),
  );
}
