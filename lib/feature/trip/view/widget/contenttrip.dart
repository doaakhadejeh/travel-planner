import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';
import 'package:travel_planner/feature/trip/view/widget/footerlistviewtrip.dart';
import 'package:travel_planner/feature/trip/view/widget/toplistviewtrip.dart';

class ContentTrip extends StatelessWidget {
  final TripResponse trip;
  const ContentTrip({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      children: [
        TopListViewTrip(),
        SizedBox(height: 4.h),
        Text(
          "${trip.country}   #${trip.id}",
          textAlign: .start,
          style: TextStyle(fontSize: 12.sp, fontWeight: .bold),
        ),
        SizedBox(height: 10.h),
        Text("${trip.days} days"),
        SizedBox(height: 2.h),
        Text("start day: ${trip.startDay}"),
        SizedBox(height: 2.h),
        FooterListViewTrip(trip: trip),
      ],
    );
  }
}
