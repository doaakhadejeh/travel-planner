import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_planner/core/constant/imagesconst.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_cubit.dart';
import 'package:travel_planner/feature/trip/logic/cubit/trip_state.dart';
import 'package:travel_planner/feature/trip/view/widget/listenertrip.dart';
import 'package:travel_planner/feature/trip/view/widget/topbartrip.dart';
import 'package:travel_planner/feature/trip/view/widget/widgetloadingtrip.dart';
import 'package:travel_planner/feature/trip/view/widget/widgetsuccesstrip.dart';

class Trip extends StatelessWidget {
  const Trip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: .all(10.sp),
        height: 700.h,
        width: double.infinity,

        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(Imagesconst.home5),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            TopBarTrip(),
            BlocBuilder<TripCubit, TripState>(
              builder: (context, state) {
                if (state is TripLoading) {
                  return WidgetLoadingTrip();
                }
                if (state is TripSuccess) {
                  final trips = state.response;
                  return Widgetsuccesstrip(trips: trips);
                }
                return const SizedBox.shrink();
              },
            ),
            ListenerTrip(),
          ],
        ),
      ),
    );
  }
}
