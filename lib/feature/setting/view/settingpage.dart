import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';
import 'package:url_launcher/url_launcher.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      body: ListView(
        children: [
          SizedBox(
            height: 250.h,
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Divider(height: 50.h, color: Colors.green.shade900),
                  Text(
                    "setting  ",
                    style: TextStyle(
                      fontWeight: .w600,
                      fontSize: 30.sp,
                      color: Colors.green.shade900,
                    ),
                  ),
                  Divider(height: 50.h, color: Colors.green.shade900),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  color: Color(0xFFF1F8E9),
                  child: ListTile(
                    title: Text("My profile"),
                    leading: Icon(Icons.person_outline),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.green.shade900,
                    ),
                    onTap: () => context.push(Routconst.profile),
                  ),
                ),
                Card(
                  color: Color(0xFFF1F8E9),
                  child: ListTile(
                    title: Text("My preference"),
                    leading: Icon(Icons.star_outline),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.green.shade900,
                    ),
                    onTap: () => context.push(Routconst.userPref),
                  ),
                ),
                Card(
                  color: Color(0xFFF1F8E9),
                  child: ListTile(
                    title: Text("About us"),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.green.shade900,
                    ),
                    leading: Icon(Icons.info_outline),
                    onTap: () => context.push(Routconst.aboutUs),
                  ),
                ),
                Card(
                  color: Color(0xFFF1F8E9),
                  child: ListTile(
                    title: Text("Report"),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.green.shade900,
                    ),
                    leading: Icon(Icons.report_problem_outlined),
                    onTap: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final Uri url = Uri.parse(
                        'https://forms.gle/s96wi2t73Vt2iirJA',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Could not open report form'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Card(
                  color: Color(0xFFF1F8E9),
                  child: ListTile(
                    title: Text("Log out"),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.green.shade900,
                    ),
                    leading: Icon(Icons.logout_outlined),
                    onTap: () {
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
                                if (!context.mounted) return;
                                context.go(Routconst.login);
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
