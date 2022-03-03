import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetTextButton(
              onTap: () {
                Navigator.pushNamed(context, '/multiple_function');
              },
              title: 'Multiple Function',
              description: 'Using Multiple function and if..else',
            ),
            WidgetTextButton(
              onTap: () {
                Navigator.pushNamed(context, '/single_function');
              },
              title: 'Single Function',
              description:
                  'Using one Function with parameter and switch case used',
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;

  const WidgetTextButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 250,
            color: Colors.brown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
