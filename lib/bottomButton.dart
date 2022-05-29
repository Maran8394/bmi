import 'package:flutter/material.dart';
import 'constantVariables.dart';

class BottomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;

  BottomButton({required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(btnText, style: kCalculateLabel)),
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
