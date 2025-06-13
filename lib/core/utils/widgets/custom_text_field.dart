import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.isObscure = false,
    this.autoValidateMode,
    this.onSaved,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isObscure;
  final AutovalidateMode? autoValidateMode;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      // autovalidateMode: autoValidateMode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: onSaved,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
