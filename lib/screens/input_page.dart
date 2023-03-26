import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

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
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                        colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE'),
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,  //baseline ile cm ile yaninadki numaranin ayni tabanda olmasi saglandi, yoksa cm sayinin orta hizasinda
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      //slider uzerinde degisiklik yapmak icin slidertheme kullandik. Nomral slidertheme kullanmamizin sebebi onda bircok ozellik yazmamiz isteniyordu.
                      //SliderTheme.of(context) diyerek sadece degisitirmek isteyecegimiz yerleri yazdik.
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),  //isaretlenmeyen kisimdaki yerlerin rengi,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        //Normalde 0xFF diye baslamasi gerekiyordu. Ama olmadi.Bu sebeple SliderTheme' a tiklayip const int overLayLight color' da 0x29 yaziyordu.
                        // Bu sebeple basa onu yazdik.
                        overlayColor: Color(0x29EB1555),  //tikladiginda etrafinda isik gibi renkli bir tasarim verdik.
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),  //slider' ın yuvarlak kisminin capi buyutuldu
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 27.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),   //bu deger uygulamayi actigimizda ilk gorulen
                          min: 120.0,
                          max: 220.0,
                        onChanged: (double newValue){   //ilk basta yazilan degistirmeyi yarıyor
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
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
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
                                width: 10.0,
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
                    child:ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age --;
                                    });
                                  },
                              ),
                              SizedBox(
                                width: 10.0,
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
          Container(
            child: BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  interpretation: calc.getInterpretation(),
                  resultText: calc.getResult(),
                )));
              },
            ),
          ),
        ],
      ), 
    );
  }
}












