import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  const BottomButton({super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
        },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: kBottomContainerColour,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: kLargeButtonTextStyle
        ) ,
      ),
    );
  }
}
