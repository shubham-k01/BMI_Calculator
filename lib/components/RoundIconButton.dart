import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        fillColor: const Color(0xFF4C4F5E),
        elevation: 6.0,
        onPressed: () {
          onPressed();
        },
        child: Icon(icon));
  }
}
