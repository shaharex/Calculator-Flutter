import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  Number({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: const Color(0xff303136),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        '${number}',
        style: const TextStyle(color: Color(0xff29A8FF), fontSize: 32),
      ),
    );
  }
}
