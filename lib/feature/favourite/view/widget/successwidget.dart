import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/favourite/data/model/favouritemodel.dart';
import 'package:travel_planner/feature/favourite/view/widget/subtitlewidget.dart';

class SuccessWidget extends StatelessWidget {
  final List<FavouriteResponse> favourites;
  const SuccessWidget({super.key, required this.favourites});

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) return Center(child: Text("No favourites yet!"));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: favourites.length,
        itemBuilder: (context, i) {
          final favourite = favourites[i];
          return InkWell(
            onTap: () =>
                context.push(Routconst.itineraryDay, extra: favourite.trip),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80.h,
                width: 100.w,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.green.shade900),
                        Text(
                          favourite.trip.country,
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),
                    SubtitleWidget(favourite: favourite),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
