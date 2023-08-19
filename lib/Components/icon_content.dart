import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class IconCard extends StatelessWidget {
  final IconData icons;
  final String gender;
  IconCard({@required this.icons, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: kBoxheight,
        ),
        Text(
          gender,
          style: kTextstyleatbottom,
        ),
      ],
    );
  }
}