import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/reuseablecard.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/Components/roundiconbutton.dart';
import 'package:bmi_calculator/Screen/result_page.dart';
import '../Components/bottombutton.dart';
import 'package:bmi_calculator/bmi_brain.dart';
enum GenderType{
  Male,
  Female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedgender;
  int height = 180;
  int weight = 70;
  int age = 19;
  // Color femalecardcolor = inactivecardcolor;
  // Color malecardcolor = inactivecardcolor;
  // void updateColor(GenderType gender){
  //   if(gender==GenderType.Male){
  //     if(malecardcolor== inactivecardcolor) {
  //       malecardcolor = activecardcolor;
  //       femalecardcolor = inactivecardcolor;
  //     }
  //     else{
  //       malecardcolor = inactivecardcolor;
  //     }
  //   }
  //   if(gender==GenderType.Female){
  //     if(femalecardcolor == inactivecardcolor) {
  //       femalecardcolor = activecardcolor;
  //       malecardcolor = inactivecardcolor;
  //     }
  //     else{
  //       femalecardcolor = inactivecardcolor;
  //     }
  //   }
  //
  // }
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
                    child: ReuseableCard(
                      onPress: (){
                        setState(() {
                          selectedgender = GenderType.Male;
                        });
                      },
                      colour: selectedgender==GenderType.Male? kActivecardcolor: kInactivecardcolor,
                      cardChild: IconCard(
                        icons: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                ),
                Expanded(
                    child: ReuseableCard(
                      onPress: (){
                        setState(() {
                          selectedgender = GenderType.Female;
                        });
                      },
                      colour: selectedgender==GenderType.Female ? kActivecardcolor: kInactivecardcolor,
                      cardChild: IconCard(
                        icons: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReuseableCard(
                  colour: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kTextstyleatbottom,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kHeightslider,
                        ),
                        Text(
                          'cm',
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x28EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                      colour: kActivecardcolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kTextstyleatbottom,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeightslider,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                    child: ReuseableCard(
                      colour: kActivecardcolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kTextstyleatbottom,
                          ),
                          Text(
                            age.toString(),
                            style: kHeightslider,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmi: calc.bmiresult(),
                      resultText: calc.resultText(),
                      interpretation: calc.interpertation(),
                    );
                  },
                ),
              );
            },
            title: 'Calculate',
          ),
        ],
      ),
    );
  }
}






