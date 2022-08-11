import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onTap,
    this.text,
  }) : super(key: key);
  final void Function()? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text!,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
