import 'package:flutter/material.dart';
import 'package:wefellowship/src/features/components/components.dart';
import 'package:wefellowship/src/configs/configs.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final Future<void> Function()? onTap;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  const TextInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.textInputType,
    this.onChanged,
    required this.obscureText,
    required this.icon,
    this.onTap,
    this.validator,
    this.maxLines,
    this.minLines,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: CustomSuffixIcon(svgIcon: icon),
        ),
      ),
    );
  }
}
