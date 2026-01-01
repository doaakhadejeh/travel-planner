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
          child: Card(
            color: Colors.white.withAlpha((0.8 * 255).round()),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 110.h,
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    TopListviewDay(itineraryDay: itineraryDay),
                    Text(
                      "summary: ${itineraryDay.summary} ",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ButtonShowActivity(itineraryDay: itineraryDay),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
