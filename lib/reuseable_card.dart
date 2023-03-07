import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color? cardColour;
  void Function()? onTap;
  final Widget? containerChild;
  CardContainer({ this.cardColour, this.onTap, this.containerChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: cardColour, borderRadius: BorderRadius.circular(8)),
            child: containerChild,
      ),
    );
  }
}
