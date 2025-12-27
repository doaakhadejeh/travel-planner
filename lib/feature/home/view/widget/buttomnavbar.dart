import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavBar(
  BuildContext context,
  int currentIndex,
  Function(int) onTap,
) {
  return Container(
    color: Colors.transparent,

    padding: EdgeInsets.only(
      top: 5.sp,
      bottom: 10.sp,
      right: 15.sp,
      left: 15.sp,
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: BottomNavigationBar(
        // backgroundColor: Color(0xFFF1F8E9),
        backgroundColor: const Color.fromARGB(255, 214, 243, 215),
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedFontSize: 10.sp,
        unselectedItemColor: Colors.green.shade700,
        selectedFontSize: 15.sp,
        selectedItemColor: Colors.green.shade900,
        type: BottomNavigationBarType.fixed,
        elevation: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    ),
  );
}
