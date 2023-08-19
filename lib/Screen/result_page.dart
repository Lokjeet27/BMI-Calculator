import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/Components/reuseablecard.dart';
import '../Components/bottombutton.dart';

class ResultPage extends StatelessWidget {
  final bmi;
  final resultText;
  final interpretation;
  ResultPage({@required this.bmi,@required this.resultText,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReuseableCard(
                colour: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kResult,
                    ),
                    Text(
                      interpretation,
                      style: kResultStatment,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(
              onTap: () => Navigator.pop(context),
              title: 'Re-Calculate',
          )
        ],
      ),
    );
  }
}

