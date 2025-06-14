import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: isHidden,
      validator: (value) {
        if (widget.keyboardType == TextInputType.emailAddress) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (!value.contains('@')) {
            return 'Enter a valid email';
          }
        } else if (widget.keyboardType == TextInputType.visiblePassword) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (value.length < 6) {
            return 'Min 6 characters';
          }
        }
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: widget.onSaved,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Colors.grey,
                ))
            : null,
      ),
    );
  }
}
