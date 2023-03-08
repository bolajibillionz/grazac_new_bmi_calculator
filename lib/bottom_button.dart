import 'constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  
  BottomButton({
    required this.onTap,
    required this.buttonText
  });
  
  void Function()? onTap;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            buttonText,
            style: kBottomTextStyle,
          ),
        ),
      ),
    );
  }
}
