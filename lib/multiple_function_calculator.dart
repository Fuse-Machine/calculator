import 'package:flutter/material.dart';

class MultipleFunctionCalculator extends StatefulWidget {
  const MultipleFunctionCalculator({Key? key}) : super(key: key);

  @override
  State<MultipleFunctionCalculator> createState() =>
      _MultipleFunctionCalculatorState();
}

class _MultipleFunctionCalculatorState
    extends State<MultipleFunctionCalculator> {
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
              'Multiple Function',
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
                          : _add,
                      text: '+',
                    ),
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : _sub,
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
                          : _mul,
                      text: 'x',
                    ),
                    CardWidget(
                      function: !isFirstNumberActive || !isSecondNumberActive
                          ? null
                          : _div,
                      text: '/',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardWidget(
                  function: _reset,
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

  void _add() {
    setState(() {
      result = double.parse(firstNumber.text) + double.parse(secondNumber.text);
    });
  }

  void _sub() {
    setState(() {
      result = double.parse(firstNumber.text) - double.parse(secondNumber.text);
    });
  }

  void _mul() {
    setState(() {
      result = double.parse(firstNumber.text) * double.parse(secondNumber.text);
    });
  }

  void _div() {
    setState(() {
      result = double.parse(firstNumber.text) / double.parse(secondNumber.text);
    });
  }

  void _reset() {
    firstNumber.clear();
    secondNumber.clear();
    result = 0;
    setState(() {});
  }
}

class CardWidget extends StatelessWidget {
  final VoidCallback? function; //_airthmeticOperation(type:'addition')
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
      //color: (function == null) ? Colors.brown : Colors.blue,
      //Colors.blueAccent,
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
