import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardReport extends StatelessWidget {
  const CardReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F8E9),
      child: ListTile(
        title: Text("Report"),
        trailing: Icon(Icons.arrow_right, color: Colors.green.shade900),
        leading: Icon(Icons.report_problem_outlined),
        onTap: () async {
          final messenger = ScaffoldMessenger.of(context);
          final Uri url = Uri.parse('https://forms.gle/s96wi2t73Vt2iirJA');

          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            messenger.showSnackBar(
              const SnackBar(content: Text('Could not open report form')),
            );
          }
        },
      ),
    );
  }
}
