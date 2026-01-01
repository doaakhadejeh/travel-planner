import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/helper/dialoghelper.dart';
import 'package:travel_planner/core/helper/sharedpref_helper.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class CardLogout extends StatelessWidget {
  const CardLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F8E9),
      child: ListTile(
        title: Text("Log out"),
        trailing: Icon(Icons.arrow_right, color: Colors.green.shade900),
        leading: Icon(Icons.logout_outlined),
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
                    if (!context.mounted) return;
                    contex(Routconst.login);
                  },
                  child: const Text("Logout"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
