import 'package:flutter/material.dart';
import 'package:qcmapp/core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {Key? key, this.text, this.color, required this.onPressed})
      : super(key: key);
  final String? text;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? AppColors.colorBlue),
        height: 40,
        alignment: Alignment.center,
        width: 300,
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
