import 'package:calculator/components.dart';
import 'package:calculator/const.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as io;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              userInput.toString(),
                              style: headingTextStyle,
                            ),
                          ),
                          Text(
                            answer.toString(),
                            style: headingTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MYbutton(
                              value: 'AC',
                              onPress: () {
                                userInput = '';
                                answer = '';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '+/-',
                              onPress: () {
                                userInput = '+';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '%',
                              onPress: () {
                                userInput += '%';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '/',
                              color: Color(0xffffa00a),
                              onPress: () {
                                userInput += '/';
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            MYbutton(
                              value: '7',
                              onPress: () {
                                userInput += '7';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '8',
                              onPress: () {
                                userInput += '8';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '9',
                              onPress: () {
                                userInput += '9';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: 'x',
                              color: Color(0xffffa00a),
                              onPress: () {
                                userInput += 'x';
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            MYbutton(
                              value: '4',
                              onPress: () {
                                userInput += '4';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '5',
                              onPress: () {
                                userInput += '5';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '6',
                              onPress: () {
                                userInput += '6';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '-',
                              color: Color(0xffffa00a),
                              onPress: () {
                                userInput += '-';
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            MYbutton(
                              value: '1',
                              onPress: () {
                                userInput += '1';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '2',
                              onPress: () {
                                userInput += '2';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '3',
                              onPress: () {
                                userInput += '3';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '+',
                              color: Color(0xffffa00a),
                              onPress: () {
                                userInput += '+';
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            MYbutton(
                              value: '0',
                              onPress: () {
                                userInput += '0';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '.',
                              onPress: () {
                                userInput += '.';
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: 'DEL',
                              onPress: () {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                setState(() {});
                              },
                            ),
                            MYbutton(
                              value: '=',
                              color: Color(0xffffa00a),
                              onPress: () {
                                EqualPress();
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]))));
  }

  void EqualPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toStringAsFixed(2);
  }
}
