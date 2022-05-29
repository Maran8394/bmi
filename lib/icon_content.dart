import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constantVariables.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label!,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
