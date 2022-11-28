import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';

class LoginTextfield extends StatelessWidget {
  final String? hint;
  final bool isObsecure;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  const LoginTextfield(
      {required this.hint,this.controller, this.validator, this.isObsecure = false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          fillColor: ColorName.white.withOpacity(0.3),
          filled: true,
          hintText: hint),
    );
  }
}
