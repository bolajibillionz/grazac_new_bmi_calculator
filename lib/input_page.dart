import 'constants.dart';
import 'card_content.dart';
import 'bottom_button.dart';
import 'reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:grazac_new_bmi_calculator/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grazac_new_bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 183;
  int weight = 74;
  int age = 19;
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
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    containerChild: CardContent(
                        iconColor: selectedGender == Gender.male
                            ? Colors.white
                            : kInactiveTextColor,
                        cardIcons: FontAwesomeIcons.mars,
                        label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    containerChild: CardContent(
                        iconColor: selectedGender == Gender.female
                            ? Colors.white
                            : kInactiveTextColor,
                        cardIcons: FontAwesomeIcons.venus,
                        label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              cardColour: kActiveCardColor,
              onTap: () {},
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        inactiveTrackColor: Color(0xff8d8e98),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        // print(newValue);
                        setState(() {
                          height = newValue.round();
                          print(height);
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    cardColour: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatingButton(
                              iconName: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            floatingButton(
                              iconName: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    cardColour: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatingButton(
                              iconName: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            floatingButton(
                              iconName: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              print(height);
              print(weight);
              CalculatorBrain calculate =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            remark: calculate.remark(),
                            result: calculate.getResult(),
                            bmiValue: calculate.calculateBMI(),
                          )));
            },
            buttonText: 'CALCULATE BMI',
          )
        ],
      ),
    );
  }

  GestureDetector floatingButton(
      {required IconData iconName, required void Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: 55,
        decoration:
            BoxDecoration(color: Color(0xff4c4f5e), shape: BoxShape.circle),
        child: Icon(
          iconName,
          color: Colors.white,
        ),
      ),
    );
  }
}
