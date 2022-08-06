import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.labelText,
      this.icon,
      this.suffixIcon,
      this.hintText,
      this.controller})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon!,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                label: Text(labelText!),
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
