import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavBar(
  BuildContext context,
  int currentIndex,
  Function(int) onTap,
) {
  return Container(
    color: Colors.grey,
    padding: EdgeInsets.only(top: 5.sp, bottom: 5.sp, right: 5.sp, left: 5.sp),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedFontSize: 10.sp,
        unselectedItemColor: Colors.green,
        selectedFontSize: 15.sp,
        selectedItemColor: Colors.green.shade900,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
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
