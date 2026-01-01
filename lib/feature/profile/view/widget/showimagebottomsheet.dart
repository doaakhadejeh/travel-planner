import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_planner/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:travel_planner/feature/profile/view/widget/bottomsheetitem.dart';

void showImagePickerBottomSheet(BuildContext context, ProfileCubit cubit) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Change Profile Image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            BottomSheetItem(
              icon: Icons.photo_camera,
              title: "Take Photo",
              onTap: () async {
                Navigator.pop(context);
                final picked = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (picked != null) {
                  cubit.profileImage(File(picked.path));
                }
              },
            ),
            BottomSheetItem(
              icon: Icons.photo_library,
              title: "Choose from Gallery",
              onTap: () async {
                Navigator.pop(context);
                final picked = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (picked != null) {
                  cubit.profileImage(File(picked.path));
                }
              },
            ),
            const SizedBox(height: 10),
            BottomSheetItem(
              icon: Icons.close,
              title: "Cancel",
              color: Colors.red,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}
