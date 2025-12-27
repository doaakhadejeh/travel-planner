import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        ListTile(
          leading: Icon(
            Icons.phone_android,
            color: Colors.green.shade900,
            size: 23.sp,
          ),
          title: Text("Phone", style: TextStyle(fontWeight: .bold)),
          onTap: () async {
            final uri = Uri(scheme: 'tel', path: "+31612345678");
            await launchUrl(uri);
          },
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.green.shade900, size: 23.sp),
          title: Text(
            "support@aitravelplanner.com",
            style: TextStyle(fontWeight: .bold),
          ),
          onTap: () async {
            final uri = Uri(
              scheme: 'mailto',
              path: 'support@aitravelplanner.com',
            );
            await launchUrl(uri);
          },
        ),
      ],
    );
  }
}
