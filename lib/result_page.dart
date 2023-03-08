import 'constants.dart';
import 'bottom_button.dart';
import 'reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: CardContainer(
                cardColour: kActiveCardColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'NORMAL',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '18.2',
                      style: kBMITextStyle,
                    ),
                    Text(
                      'You are too fat, go to the gym',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomButton(
            onTap: () {},
            buttonText: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
