import 'package:app/src/config/config.dart';
import 'package:app/src/utils/utils.dart';
import 'package:flutter/material.dart';

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
          color: ColorConstants.smallIconColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: Styles.titleTextStyle(fontSize: 16),
        )
      ],
    );
  }
}
