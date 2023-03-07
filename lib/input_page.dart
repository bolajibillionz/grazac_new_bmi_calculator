import 'constants.dart';
import 'card_content.dart';
import 'reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      onTap: () {
                        print('this is Lagos');
                      },
                      cardColour: kActiveCardColor,
                      containerChild: CardContent(
                          cardIcons: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      cardColour: kActiveCardColor,
                      containerChild: CardContent(
                          cardIcons: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                cardColour: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      cardColour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      cardColour: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
