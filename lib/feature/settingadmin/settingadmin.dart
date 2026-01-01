import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:travel_planner/feature/settingadmin/widget/settingcard.dart';

class SettingAdmin extends StatelessWidget {
  const SettingAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Settings'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SettingsCard(
              icon: Icons.person_outline,
              title: 'Profile',
              subtitle: 'View and edit admin profile',
              onTap: () {
                context.push(Routconst.profile);
              },
            ),
            SizedBox(height: 16.h),
            SettingsCard(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Sign out from admin panel',
              isDanger: true,
              onTap: () {
                final contex = context.go;
                myDialog(
                  context,
                  title: 'Are you sure you want to logout?',
                  content: Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await SharedPrefHelper.logout();
                          contex(Routconst.login);
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
