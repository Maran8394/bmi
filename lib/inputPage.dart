import 'package:bmi2/calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constantVariables.dart';
import 'package:bmi2/results_page.dart';
import 'bottomButton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReUsableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  clr: (selectedGender == Gender.male)
                      ? activeColor
                      : inActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "Male",
                  ),
                ),
              ),
              Expanded(
                child: ReUsableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  clr: (selectedGender == Gender.female)
                      ? activeColor
                      : inActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReUsableCard(
                clr: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Height",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: heightCardStyles,
                        ),
                        const Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        // activeTrackColor: Colors.white,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReUsableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: heightCardStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (weight != 0) {
                                  weight--;
                                } else {
                                  weight = 0;
                                }
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
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
                  clr: activeColor,
                ),
              ),
              Expanded(
                child: ReUsableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: heightCardStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age != 0) {
                                    age--;
                                  } else {
                                    age = 0;
                                  }
                                });
                              }),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  clr: activeColor,
                ),
              )
            ],
          ),
        ),
        BottomButton(
          btnText: "CALCULATE",
          onTap: () {
            Calculations calc = Calculations(height: height, weight: weight);

            String bmiResult = calc.calculateBMI();
            String resultStringText = calc.getResult();
            String interpretationTxt = calc.getInterpretation();
            print("$bmiResult, $resultStringText, $interpretationTxt");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmiResult: bmiResult,
                  resultStringText: resultStringText,
                  interpretation: interpretationTxt,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(height: 56.0, width: 56.0),
      elevation: 6.0,
    );
  }
}
