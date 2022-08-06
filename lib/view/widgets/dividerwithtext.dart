import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            height: 3,
            color: Colors.black,
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "OR",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            )),
        const Expanded(
          child: Divider(
            height: 3,
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
