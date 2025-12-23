import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text(favourite.trip.country),
              subtitle: SubtitleWidget(favourite: favourite),
            ),
          );
        },
      ),
    );
  }
}
