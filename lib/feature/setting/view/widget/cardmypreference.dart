import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_planner/core/routing/const_rout.dart';

class CardMyPreference extends StatelessWidget {
  const CardMyPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F8E9),
      child: ListTile(
        title: Text("My preference"),
        leading: Icon(Icons.star_outline),
        trailing: Icon(Icons.arrow_right, color: Colors.green.shade900),
        onTap: () => context.push(Routconst.userPref),
      ),
    );
  }
}
