import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String? hint;
  final String labelText;
  final bool? isPassword;
  final IconData? suffixIcon;
  final double? width;
  final String? helperText;
  final TextInputType? textInputType;
  final Function(String) onChanged;
  const InputTextField({
    Key? key,
    this.hint,
    required this.labelText,
    this.isPassword,
    this.suffixIcon,
    this.width,
    this.helperText,
    this.textInputType,
    required this.onChanged, required TextEditingController controller, required InputDecoration decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          }
          return null;
        },
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
            suffixIcon: Icon(suffixIcon),
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hint,
            helperText: helperText),
      ),
    );
  }
}