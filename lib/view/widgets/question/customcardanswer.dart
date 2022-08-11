import 'package:flutter/material.dart';

class CustomCardAnswer extends StatelessWidget {
  const CustomCardAnswer({
    Key? key,
    this.text,
    this.onTap,
    this.index,
    this.questionId,
    this.color,
  }) : super(key: key);
  final String? text;
  final void Function()? onTap;
  final int? index, questionId;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color ?? Colors.blue,
              border: Border.all(
                width: 2,
                color: Colors.blue,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
