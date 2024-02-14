import 'package:flutter/material.dart';

// ignore: camel_case_types
class Check_pass extends StatelessWidget {
  final String text;
  final bool ispass;
  const Check_pass({super.key, required this.text, required this.ispass});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration:
              BoxDecoration(
                color:ispass?Colors.green: Colors.white,
                 shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400)
                
                ),
          child: const Icon(
            Icons.check,
            size: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    );
  }
}
