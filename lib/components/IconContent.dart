import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final String gender;
  final IconData icon;

  const IconContent({super.key,  required this.gender,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF8D8E98)
          ),
        ),
      ],
    );
  }
}