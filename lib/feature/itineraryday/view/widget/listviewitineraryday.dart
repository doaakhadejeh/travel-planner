import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/itineraryday/data/model/itineraraydaymodel.dart';
import 'package:travel_planner/feature/itineraryday/view/widget/buttonshowactivity.dart';
import 'package:travel_planner/feature/itineraryday/view/widget/toplistviewday.dart';

class ListviewItineraryDay extends StatelessWidget {
  final List<ItineraryDayResponse> itineraryDays;
  const ListviewItineraryDay({super.key, required this.itineraryDays});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itineraryDays.length,
      itemBuilder: (context, i) {
        final itineraryDay = itineraryDays[i];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
          child: Container(
            height: 120.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceEvenly,
                children: [
                  TopListviewDay(itineraryDay: itineraryDay),

                  Text(
                    "summary: ${itineraryDay.summary} ",
                    style: TextStyle(
                      overflow: .clip,
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
                  ),
                  ButtonShowActivity(itineraryDay: itineraryDay),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
