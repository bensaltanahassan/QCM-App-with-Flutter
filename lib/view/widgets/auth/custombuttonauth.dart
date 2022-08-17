import 'package:flutter/material.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/functions/getdimension.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {Key? key,
      this.text,
      this.color,
      required this.onPressed,
      this.textColor,
      this.borderColor,
      this.withButton})
      : super(key: key);
  final String? text;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double? withButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? AppColors.blue,
            boxShadow: [
              BoxShadow(color: borderColor ?? Colors.blue, spreadRadius: 1),
            ]),
        height: getHeight(40),
        alignment: Alignment.center,
        width: withButton ?? getWith(300),
        child: Text(
          text!,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
