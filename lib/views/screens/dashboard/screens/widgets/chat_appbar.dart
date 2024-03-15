import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(10.0),
      color: Color(flyLight.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                ),
                radius: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomKarlaText(
                    text: 'Flymedia (Campaign 1)',
                    size: 3,
                    weight: FontWeight.w700,
                  ),
                  const HeightSpacer(size: 4),
                  CustomKarlaText(
                    text: 'Admin, Client, Influencer',
                    size: 2.5,
                    weight: FontWeight.w400,
                    color: Color(hintTextColor.value).withOpacity(0.6),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
