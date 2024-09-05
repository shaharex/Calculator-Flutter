import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/number.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String btnText) {
    if (btnText == 'C') {
      setState(() {
        output = '';
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else if (btnText == 'D' && output.isNotEmpty) {
      setState(() {
        output = output.substring(0, output.length - 1);
      });
    } else if (btnText == '/' ||
        btnText == '*' ||
        btnText == '-' ||
        btnText == '+') {
      setState(() {
        num1 = double.parse(output);

        operand = btnText;

        output = '';
      });
    } else if (btnText == '.') {
      setState(() {
        if (output.contains('.')) {
          print('Already has a dot');
          return;
        } else {
          output = output + btnText;
        }
      });
    } else if (btnText == '=') {
      setState(() {
        num2 = double.parse(output);

        if (operand == "+") {
          output = (num1 + num2).toString();
        } else if (operand == "-") {
          output = (num1 - num2).toString();
        } else if (operand == "/") {
          output = (num1 / num2).toString();
        } else if (operand == "*") {
          output = (num1 * num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else {
      setState(() {
        output = output + btnText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              SizedBox(
                  height: 36,
                  width: 36,
                  child: Image.asset(
                    '/images/calculator.png',
                    fit: BoxFit.contain,
                  )),
              const Text(
                '  Calculator',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${output}',
                      style: const TextStyle(color: Colors.white, fontSize: 48),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    // clean delete
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => buttonPressed('C'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff616161),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'C',
                              style: TextStyle(
                                  color: Color(0xffA5A5A5), fontSize: 26),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => buttonPressed('P'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff616161),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'π',
                              style: TextStyle(
                                  color: Color(0xffA5A5A5), fontSize: 26),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => buttonPressed('D'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff616161),
                                borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset('assets/images/Vector.svg'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => buttonPressed('/'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff005DB2),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              '/',
                              style: TextStyle(
                                  color: Color(0xff339DFF), fontSize: 26),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // 7 8 9 -
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => buttonPressed('7'),
                            child: Number(number: 7)),
                        GestureDetector(
                            onTap: () => buttonPressed('8'),
                            child: Number(number: 8)),
                        GestureDetector(
                            onTap: () => buttonPressed('9'),
                            child: Number(number: 9)),
                        GestureDetector(
                          onTap: () => buttonPressed('*'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff005DB2),
                                borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset('/images/_.svg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 4 5 6
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => buttonPressed('4'),
                            child: Number(number: 4)),
                        GestureDetector(
                            onTap: () => buttonPressed('5'),
                            child: Number(number: 5)),
                        GestureDetector(
                            onTap: () => buttonPressed('6'),
                            child: Number(number: 6)),
                        GestureDetector(
                          onTap: () => buttonPressed('-'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff005DB2),
                                borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset('/images/-.svg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 1 2 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => buttonPressed('1'),
                            child: Number(number: 1)),
                        GestureDetector(
                            onTap: () => buttonPressed('2'),
                            child: Number(number: 2)),
                        GestureDetector(
                            onTap: () => buttonPressed('3'),
                            child: Number(number: 3)),
                        GestureDetector(
                          onTap: () => buttonPressed('+'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff005DB2),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              '+',
                              style: TextStyle(
                                  color: Color(0xff339DFF), fontSize: 32),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // 0 . =
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => buttonPressed('0'),
                            child: Number(number: 0)),
                        GestureDetector(
                          onTap: () => buttonPressed('.'),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff005DB2),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              '.',
                              style: TextStyle(
                                  color: Color(0xff339DFF), fontSize: 32),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => buttonPressed('='),
                          child: Container(
                            alignment: Alignment.center,
                            width: 160,
                            height: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xff1991FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              '=',
                              style: TextStyle(
                                  color: Color(0xffB2DAFF), fontSize: 36),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
