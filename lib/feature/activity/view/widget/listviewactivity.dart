import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/activity/data/model/activitymodel.dart';

class Listviewactivity extends StatelessWidget {
  final List<ActivityResponse> activities;
  const Listviewactivity({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        final activity = activities[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 140.h,
            width: 300.h,
            padding: .all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: activity.type == 'meal' ? Colors.purple : Colors.green,
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(
                      "type : ${activity.type}",
                      style: TextStyle(
                        color: activity.type == 'meal'
                            ? Colors.purple
                            : Colors.green,
                        fontSize: 12.sp,
                      ),
                    ),
                    activity.type == 'meal'
                        ? Icon(Icons.local_pizza, color: Colors.purple)
                        : Icon(Icons.travel_explore, color: Colors.green),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  activity.title,
                  style: TextStyle(fontWeight: .bold, fontSize: 15.sp),
                ),
                Text(
                  activity.description,
                  style: TextStyle(color: Colors.grey, fontSize: 8.sp),
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      "time :${activity.time}",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    Icon(Icons.timelapse),
                    SizedBox(width: 5.w),
                    Text(
                      "location :${activity.location}",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    Icon(Icons.location_on_outlined),
                  ],
                ),

                SizedBox(width: 10.w),
                Row(
                  children: [
                    Text(
                      "cost :${activity.cost}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: .bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    Icon(Icons.money, color: Colors.green.shade900),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
