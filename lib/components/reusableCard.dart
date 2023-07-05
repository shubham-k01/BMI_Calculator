import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {


  // final is used when we need some value when the app is running
  // and we use const when we fix some value and it is a compile time constant


  ReusableCard(this.cardColor, this.cardChild,this.func, {super.key});

  final Color cardColor;
  final Widget? cardChild;
  late Function? func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        func!();
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        //When using decoration property we need to use color property inside of the decoration property
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
