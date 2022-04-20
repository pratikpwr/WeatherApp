import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/text_styles.dart';

class IconDetailWidget extends StatelessWidget {
  const IconDetailWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.smallIconColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: titleTextStyle(fontSize: 16),
        )
      ],
    );
  }
}
