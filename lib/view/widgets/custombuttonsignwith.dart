import 'package:flutter/material.dart';

class CustomButtonSignWith extends StatelessWidget {
  const CustomButtonSignWith({Key? key, this.text, this.icon})
      : super(key: key);
  final String? text;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200),
        height: 40,
        alignment: Alignment.center,
        width: 300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 1, child: icon!),
            Expanded(
              flex: 2,
              child: Text(
                text!,
                style: TextStyle(color: Colors.grey[900], fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
