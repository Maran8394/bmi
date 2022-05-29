import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  final Color clr;
  final Widget? cardChild;
  final VoidCallback? onPress;
  ReUsableCard({required this.clr, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(5.0),
        height: 200.0,
        width: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: clr,
        ),
      ),
    );
  }
}
