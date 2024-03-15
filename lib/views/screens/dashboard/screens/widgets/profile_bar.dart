import 'package:flutter/material.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.077,
        width: MediaQuery.of(context).size.width * 0.25,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const CustomKarlaText(
          text: 'Conversations',
          align: TextAlign.start,
          size: 5,
          weight: FontWeight.w700,
        ));
  }
}
