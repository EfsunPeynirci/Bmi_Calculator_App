import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  ResultsPage({@required this.bmiResult, @required this.interpretation, @required this.resultText});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,  //YOUR RESULT yazisini kutucugun ustune dogru olmasi saglandi
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText!.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult!,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation!,
                      textAlign: TextAlign.center,   //metnin ortalanmasi saglandi
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'
          ),
        ],
      ),
    );
  }
}
