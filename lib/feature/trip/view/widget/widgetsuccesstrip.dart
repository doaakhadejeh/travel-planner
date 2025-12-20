import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/trip/data/model/tripmodel.dart';
import 'package:travel_planner/feature/trip/view/widget/contenttrip.dart';

class Widgetsuccesstrip extends StatelessWidget {
  final List<TripResponse> trips;
  const Widgetsuccesstrip({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100.h,
      left: 10.w,
      right: 10.w,
      child: Expanded(
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, i) {
            final trip = trips[i];
            return InkWell(
              onTap: () {
                context.push(Routconst.itineraryDay, extra: trip);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 1.w),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ContentTrip(trip: trip),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
