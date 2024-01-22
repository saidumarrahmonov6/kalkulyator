import 'package:flutter/material.dart';
import 'package:kalkulyator/custom_button.dart';
import 'package:math_expressions/math_expressions.dart';

import 'main_button.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expermission = "";
  int testq = 0;
  String result="";
  TextEditingController number = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.black54,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.bottomRight,
                child: TextField(
                  readOnly: true,
                  showCursor: true,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.none,
                  controller: number,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                ),
                height: 100,
                width: MediaQuery.of(context).size.width - 10,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              )),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                height: 60,
                width: MediaQuery.of(context).size.width - 10,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  children: [
                    Main_Button(
                      character: 'AC',
                      voidCallback: () {
                        setState(() {
                          number = TextEditingController(text: '');
                          expermission = "";
                          testq=0;
                        });
                        calculate(number.text);
                      },
                    ),
                    Main_Button(
                      character: 'X',
                      voidCallback: () {
                        setState(() {
                          if(number.text.length==1){
                            setState(() {
                              expermission = "";
                              number = TextEditingController(text: "");
                            });
                          }
                          number = TextEditingController(text: number.text.substring(0,number.text.length-1));
                          expermission = number.text.substring(0,number.text.length-1);
                        });
                        calculate(number.text);
                      },
                    ),
                    Main_Button(
                      character: '%',
                      voidCallback: () {
                        add("%");
                      },
                    ),
                    Main_Button(
                      character: '/',
                      voidCallback: () {
                        add("/");
                      },
                    ),
                    Button(
                      character: '7',
                      voidCallback: () {
                        add("7");
                      },
                    ),
                    Button(
                      character: '8',
                      voidCallback: () {
                        add("8");
                      },
                    ),
                    Button(
                      character: '9',
                      voidCallback: () {
                        add("9");
                      },
                    ),
                    Main_Button(
                      character: '*',
                      voidCallback: () {
                        add("*");
                      },
                    ),
                    Button(
                      character: '4',
                      voidCallback: () {
                        add("4");
                      },
                    ),
                    Button(
                      character: '5',
                      voidCallback: () {
                        add("5");
                      },
                    ),
                    Button(
                      character: '6',
                      voidCallback: () {
                        add("6");
                      },
                    ),
                    Main_Button(
                      character: '-',
                      voidCallback: () {
                        add("-");
                      },
                    ),
                    Button(
                      character: '1',
                      voidCallback: () {
                        add("1");
                      },
                    ),
                    Button(
                      character: '2',
                      voidCallback: () {
                        add("2");
                      },
                    ),
                    Button(
                      character: '3',
                      voidCallback: () {
                        add("3");
                      },
                    ),
                    Main_Button(
                      character: '+',
                      voidCallback: () {
                        add("+");
                      },
                    ),
                    Main_Button(
                      character: '( )',
                      voidCallback: () {
                        testq++;
                        if(testq%2==1){
                          add("(");
                        } else { 
                          add(")");
                        }
                      },
                    ),
                    Button(
                      character: '0',
                      voidCallback: () {
                        add("0");
                      },
                    ),
                    Main_Button(
                      character: ',',
                      voidCallback: () {
                        add(",");
                      },
                    ),
                    Main_Button(
                      character: '=',
                      voidCallback: () {
                        setState(() {
                          number = TextEditingController(text: "");
                          expermission = "";
                          number = TextEditingController(text: result);
                          expermission = result;
                          result = "";
                        });

                      },
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
  add(String exp){
    setState(() {
      expermission += exp;
      number = TextEditingController(text: expermission);
    });
    calculate(number.text);
  }
  calculate(String mathExp){
    try {
      setState(() {
        ContextModel cm = ContextModel();
        Parser parser = Parser();
        Expression exp = parser.parse(mathExp);
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result = eval.toString();
      });
    } catch(e){
      if(number.text.length == 0){
        result = "0";
      } else {
        result = "ERROR";
      }
    }
  }

}
