import 'package:flutter/material.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/animated_button.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';

class FlyButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? flyColorText;
  final String? title;
  const FlyButton({
    super.key,
    required this.onTap,
    this.color,
    this.flyColorText,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      child: MiniRoundedButton(
        containerColor: color ?? Color(flyLight.value),
        title: title ?? 'Edit Plan',
        textColor: flyColorText ?? Color(mainColor.value),
      ),
    );
  }
}
