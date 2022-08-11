import 'package:flutter/material.dart';
import 'package:qcmapp/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.labelText,
      this.icon,
      this.suffixIcon,
      this.hintText,
      this.controller,
      this.validator,
      this.isPassword})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon!,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            obscureText: isPassword ?? false,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              label: Text(labelText!),
              hintText: hintText,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.blue)),
              suffixIcon: suffixIcon,
            ),
          ),
        )
      ],
    );
  }
}
