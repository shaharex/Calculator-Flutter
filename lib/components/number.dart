import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  const Number({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        '$number',
        style: const TextStyle(color: Color(0xff29A8FF), fontSize: 32),
      ),
    );
  }
}
