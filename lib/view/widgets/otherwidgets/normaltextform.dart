import 'package:flutter/material.dart';

class NormalTextFormField extends StatelessWidget {
  const NormalTextFormField(
      {Key? key, required this.labelText, this.controller, this.validator})
      : super(key: key);

  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 80, maxWidth: 300),
          labelText: labelText,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black45, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.blue, width: 3)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.blue, width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black45, width: 2))),
    );
  }
}
