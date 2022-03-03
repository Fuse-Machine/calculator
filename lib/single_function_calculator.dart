import 'package:flutter/material.dart';

class SingleFunctionCalculator extends StatefulWidget {
  const SingleFunctionCalculator({Key? key}) : super(key: key);

  @override
  State<SingleFunctionCalculator> createState() =>
      _SingleFunctionCalculatorState();
}

class _SingleFunctionCalculatorState extends State<SingleFunctionCalculator> {
  double result = 0;
  bool isFirstNumberActive = false;
  bool isSecondNumberActive = false;
  late TextEditingController firstNumber;
  late TextEditingController secondNumber;

  @override
  void initState() {
    super.initState();
    firstNumber = TextEditingController();
    secondNumber = TextEditingController();
    firstNumber.addListener(() {
      setState(() {
        isFirstNumberActive = firstNumber.text.isNotEmpty;
      });
    });
    secondNumber.addListener(() {
      setState(() {
        isSecondNumberActive = secondNumber.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            const Text(
              'Single Function',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: firstNumber,
              //onChanged: ,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'First Number'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Second Number'),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : () {
                              _airthmeticOperation('addition');
                            },
                      text: '+',
                    ),
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : () {
                              _airthmeticOperation('substraction');
                            },
                      text: '-',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : () {
                              _airthmeticOperation('multiplication');
                            },
                      text: 'x',
                    ),
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : () {
                              _airthmeticOperation('division');
                            },
                      text: '/',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardWidget(
                  function: () {
                    _airthmeticOperation('reset');
                  },
                  text: 'Reset',
                ),
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    'Result is: $result',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _airthmeticOperation(String type) {
    switch (type) {
      case 'add':
        result =
            double.parse(firstNumber.text) + double.parse(secondNumber.text);

        break;
      case 'addition':
        result =
            double.parse(firstNumber.text) + double.parse(secondNumber.text);
        break;
      case 'substraction':
        result =
            double.parse(firstNumber.text) - double.parse(secondNumber.text);
        break;
      case 'multiplication':
        result =
            double.parse(firstNumber.text) * double.parse(secondNumber.text);
        break;
      case 'division':
        result =
            double.parse(firstNumber.text) / double.parse(secondNumber.text);
        break;
      case 'reset':
        firstNumber.clear();
        secondNumber.clear();
        result = 0;
        break;
    }
    setState(() {
      result = double.parse(result.toStringAsFixed(2));
    });
  }
}

class CardWidget extends StatelessWidget {
  final VoidCallback? function; //__cal(type:'add')
  final String? text;
  final Icon? icon;

  const CardWidget({
    Key? key,
    this.function,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 130,
        child: ElevatedButton(
          onPressed: function,
          child: Text(
            text!,
            style: const TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
