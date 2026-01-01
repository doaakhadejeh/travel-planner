import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_state.dart';
import 'package:travel_planner/feature/profile/view/widget/widgetsuccessprofile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            myDialog(
              context,
              title: state.error.message,
              content: const Icon(Icons.error, color: Colors.red),
            );
          }
          if (state is ProfileImageUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Image updated successfully")),
            );
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            }
            if (state is ProfileSuccess) {
              final profile = state.response;
              return WidgetsuccessProfile(profile: profile);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
