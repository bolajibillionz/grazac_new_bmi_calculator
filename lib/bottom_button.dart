import 'constants.dart';
import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            'CALCULATE BMI',
            style: kBottomTextStyle,
          ),
        ),
      ),
    );
  }
}