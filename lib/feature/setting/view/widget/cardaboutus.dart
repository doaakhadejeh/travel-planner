import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class CardAboutUs extends StatelessWidget {
  const CardAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F8E9),
      child: ListTile(
        title: Text("About us"),
        trailing: Icon(Icons.arrow_right, color: Colors.green.shade900),
        leading: Icon(Icons.info_outline),
        onTap: () => context.push(Routconst.aboutUs),
      ),
    );
  }
}
