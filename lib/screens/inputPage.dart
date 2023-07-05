import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard.dart';
import '../components/IconContent.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender { male, female }

class BMIHome extends StatefulWidget {
  const BMIHome({Key? key}) : super(key: key);

  @override
  State<BMIHome> createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  late Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  maleCardColor,
                  const IconContent(
                    gender: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                  () {
                    setState(() {
                      maleCardColor = maleCardColor == kInactiveCardColour
                          ? kActiveCardColour
                          : kInactiveCardColour;
                      femaleCardColor = kInactiveCardColour;
                      selectedGender = Gender.male;
                    });
                  },
                )),
                Expanded(
                    child: ReusableCard(
                        femaleCardColor,
                        const IconContent(
                          gender: 'FEMALE',
                          icon: FontAwesomeIcons.venus,
                        ), () {
                  setState(() {
                    femaleCardColor = femaleCardColor == kInactiveCardColour
                        ? kActiveCardColour
                        : kInactiveCardColour;
                    maleCardColor = kInactiveCardColour;
                    selectedGender = Gender.female;
                  });
                }))
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                const Color(0xFF1D1E33),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle.copyWith(color: Colors.white),
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),

                    //One way of changing the theme of the slider by providing the current context of the slider
                    // and then changing whichever properties we want to
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight.round();
                            });
                          }),
                    ),

                    //Second way - directly using SliderThemeData
                    // SliderTheme(
                    //   data: const SliderThemeData(
                    //       activeTrackColor: Colors.white,
                    //       inactiveTrackColor: Color(0xFF8D8E98),
                    //       thumbColor: Color(0xFFEB1555),
                    //       overlayColor: Color(0x29EB1555),
                    //       thumbShape:
                    //           RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    //       overlayShape:
                    //           RoundSliderOverlayShape(overlayRadius: 30.0)),
                    //   child: Slider(
                    //       value: height.toDouble(),
                    //       min: 120,
                    //       max: 220,
                    //       onChanged: (double newHeight) {
                    //         setState(() {
                    //           height = newHeight.round();
                    //         });
                    //       }),
                    // )
                  ],
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      const Color(0xFF1D1E33),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style:
                                kNumberTextStyle.copyWith(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: ReusableCard(
                      const Color(0xFF1D1E33),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style:
                                kNumberTextStyle.copyWith(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultsPage(
                      bmi: cal.getBMI(),
                      result: cal.getResult(),
                      interpretation: cal.getInterpretation(),
                    );
                  }),
                );
              })
        ],
      ),
    );
  }
}
