import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.question,
  }) : super(key: key);
  final String? question;
  @override
  Widget build(BuildContext context) {
    return Text(
      question!,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, height: 1.3, fontFamily: 'Cairo'),
    );
  }
}
