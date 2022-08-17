import 'package:flutter/material.dart';
import 'package:qcmapp/core/functions/getdimension.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            height: getHeight(3),
            color: Colors.black,
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: getHeight(20)),
            child: Text(
              "OR",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            )),
        Expanded(
          child: Divider(
            height: getHeight(3),
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
