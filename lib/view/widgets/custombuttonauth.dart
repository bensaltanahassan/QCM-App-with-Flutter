import 'package:flutter/material.dart';
import 'package:qcmapp/core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {Key? key,
      this.text,
      this.color,
      required this.onPressed,
      this.textColor,
      this.borderColor})
      : super(key: key);
  final String? text;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? AppColors.blue,
            boxShadow: const [
              BoxShadow(color: Colors.blue, spreadRadius: 1),
            ]),
        height: 40,
        alignment: Alignment.center,
        width: 300,
        child: Text(
          text!,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
