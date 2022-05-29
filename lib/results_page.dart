import 'package:bmi2/constantVariables.dart';
import 'package:flutter/material.dart';
import 'package:bmi2/reusable_card.dart';
import 'bottomButton.dart';
import 'calculation.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultStringText;
  final String interpretation;

  ResultPage(
      {required this.resultStringText,
      required this.bmiResult,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kResultPageTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUsableCard(
              clr: inActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultStringText.toUpperCase(),
                    style: resultText,
                  ),
                  Text(
                    bmiResult,
                    style: bmiText,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: resultBodyText,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            btnText: "RECALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
