import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myflutterdashboard/calc/appbar.dart';
import 'package:myflutterdashboard/calc/constants.dart';
import 'package:myflutterdashboard/calc/newcard.dart';
import 'package:myflutterdashboard/calc/number_row.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<int> num1List = [];
  List<int> num2List = [];
  String resultValue = '0';
  int numOne;
  int numTwo;
  int calculatedValue;
  int operaterSign;
  String sign;
  String inputValue = '';
  int darkMode = 1;
  Color numColor = white;
  Color signColor = green;
  Color keypad = primaryKeypad;
  Color secondaryKeypad = Color(0xff545454);

  assignNumber(int numb) {
    // if (inputValue.length < 10)
    setState(() {
      if (calculatedValue != null) {
        numOne = calculatedValue;
        num2List.add(numb);
        numTwo = int.parse(num2List.join());
        inputValue = '$numOne' + '$sign' + '$numTwo';
      } else {
        if (sign == null) {
          if (num1List.length < 10) {
            num1List.add(numb);
            numOne = int.parse(num1List.join());
            inputValue = '$numOne';
          }
        } else if (sign != null) {
          if (num2List.length < 10) {
            num2List.add(numb);
            numTwo = int.parse(num2List.join());
            inputValue = '$numOne' + '$sign' + '$numTwo';
          }
        }
      }
    });
  }

  assignSign(String si) {
    setState(() {
      if (calculatedValue != null) {
        calculate();
        numOne = calculatedValue;
        num2List.clear();
        sign = si;
        inputValue = '$numOne' + '$sign';
        calculatedValue = null;
      } else if (numOne != null && numTwo != null) {
        calculate();
        numOne = calculatedValue;
        num2List.clear();
        sign = si;
        inputValue = '';
        calculatedValue = 0;
        numTwo = null;
      } else if (numOne == null) {
        numOne = 0;
        sign = null;
      } else {
        sign = si;
        inputValue = '$numOne' + '$sign';
      }
    });
  }

  calculate() {
    setState(() {
      if (numTwo == null && numOne == null) {
        resultValue = '$numOne';
      } else {
        if (operaterSign == 1) {
          addition();
        } else if (operaterSign == 2) {
          subtraction();
        } else if (operaterSign == 3) {
          multiplication();
        } else if (operaterSign == 4) {
          division();
        } else if (operaterSign == 5) {
          percentage();
        } else if (operaterSign == 6) {
          exponential();
        }
      }
    });
  }

  addition() {
    try {
      setState(() {
        calculatedValue = numOne + numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  subtraction() {
    try {
      setState(() {
        calculatedValue = numOne - numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  multiplication() {
    try {
      setState(() {
        calculatedValue = numOne * numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  division() {
    setState(() {
      if (numTwo == 0) {
        resultValue = "Can't divide by 0";
      } else {
        double divNumber = numOne / numTwo;
        resultValue = divNumber.toString();
      }
    });
  }

  percentage() {
    setState(() {
      double percentNumber = numOne / 100 * numTwo;
      resultValue = percentNumber.toString();
    });
  }

  exponential() {
    setState(() {
      calculatedValue = pow(numOne, numTwo);
      resultValue = calculatedValue.toString();
    });
  }

  backspace() {
    if (num1List.length == 0) {
      clear();
    } else {
      setState(() {
        if (num2List.length == 0 && sign == null && num1List.length != 0) {
          if (num1List.length == 1) {
            inputValue = '';
            resultValue = '';
          } else {
            num1List.removeLast();
            numOne = int.parse(num1List.join());
            inputValue = '$numOne';
          }
          //
        } else if (sign != null &&
            num1List.length != 0 &&
            num2List.length == 0) {
          sign = null;
          inputValue = '$numOne';
          //
        } else if (num2List != null) {
          if (num2List.length == 1) {
            num2List.clear();
            inputValue = '$numOne' + '$sign';
          } else {
            num2List.removeLast();
            numTwo = int.parse(num2List.join());
            inputValue = '$numOne' + '$sign' + '$numTwo';
          }
        }
      });
    }
  }

  clear() {
    setState(() {
      calculatedValue = null;
      inputValue = '';
      resultValue = '0';
      numOne = null;
      numTwo = null;
      sign = null;
      num1List.clear();
      num2List.clear();
    });
  }

  setDarkMode() {
    setState(() {
      darkMode == 1 ? darkMode = 0 : darkMode = 1;
      // numColor = darkMode == 1 ? white : black;
      keypad = darkMode == 1 ? primaryKeypad : secondaryKeypad;
      signColor = darkMode == 0 ? blue : green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppbar(
        context: context,
        title: 'Calc+',
        barColor: darkMode == 1 ? Colors.black38 : white,
        itemColor: darkMode == 1 ? white : black,
        onpressed: () => setDarkMode(),
        mode: darkMode,
      ),
      backgroundColor: keypad,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: darkMode == 1 ? Colors.black38 : white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          inputValue,
                          style: TextStyle(
                            fontSize: inputValue.length > 10 ? 20 : 40,
                            color: signColor,
                          ),
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    resultValue,
                    style: TextStyle(
                      fontSize: resultValue.length > 8 ? 30 : 50,
                      fontWeight: FontWeight.bold,
                      color: darkMode == 0 ? black : white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: NumberRow(
                      keypadColor: keypad,
                      symbol1: 'C',
                      symbol2: '<-',
                      symbol3: '%',
                      symbol4: '^',
                      textColor1: signColor,
                      textColor2: signColor,
                      textColor3: signColor,
                      textColor4: signColor,
                      ontap1: () => clear(),
                      ontap2: () => backspace(),
                      ontap3: () {
                        setState(() {
                          assignSign('%');
                          operaterSign = 5;
                        });
                      },
                      ontap4: () {
                        setState(() {
                          assignSign('^');
                          operaterSign = 6;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: NumberRow(
                      keypadColor: keypad,
                      symbol1: '7',
                      symbol2: '8',
                      symbol3: '9',
                      symbol4: '÷',
                      textColor1: numColor,
                      textColor2: numColor,
                      textColor3: numColor,
                      textColor4: signColor,
                      ontap1: () => assignNumber(7),
                      ontap2: () => assignNumber(8),
                      ontap3: () => assignNumber(9),
                      ontap4: () {
                        setState(() {
                          assignSign('÷');
                          operaterSign = 4;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: NumberRow(
                      keypadColor: keypad,
                      symbol1: '4',
                      symbol2: '5',
                      symbol3: '6',
                      symbol4: 'x',
                      textColor1: numColor,
                      textColor2: numColor,
                      textColor3: numColor,
                      textColor4: signColor,
                      ontap1: () => assignNumber(4),
                      ontap2: () => assignNumber(5),
                      ontap3: () => assignNumber(6),
                      ontap4: () {
                        setState(() {
                          assignSign('x');
                          operaterSign = 3;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: NumberRow(
                      keypadColor: keypad,
                      symbol1: '1',
                      symbol2: '2',
                      symbol3: '3',
                      symbol4: '-',
                      textColor1: numColor,
                      textColor2: numColor,
                      textColor3: numColor,
                      textColor4: signColor,
                      ontap1: () => assignNumber(1),
                      ontap2: () => assignNumber(2),
                      ontap3: () => assignNumber(3),
                      ontap4: () {
                        setState(() {
                          assignSign('-');
                          operaterSign = 2;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: NumberRow(
                      keypadColor: keypad,
                      symbol1: '.',
                      symbol2: '0',
                      symbol3: '=',
                      symbol4: '+',
                      textColor1: numColor,
                      textColor2: numColor,
                      textColor3: signColor,
                      textColor4: signColor,
                      ontap1: () {},
                      ontap2: () => assignNumber(0),
                      ontap3: () => calculate(),
                      ontap4: () {
                        setState(() {
                          assignSign('+');
                          operaterSign = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
