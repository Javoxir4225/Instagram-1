import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';

class LoginTextfield extends StatefulWidget {
  final String? hint;
  final bool isObsecure;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  LoginTextfield({
    required this.hint,
    this.controller,
    this.validator,
    super.key,
    this.isObsecure = false,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  bool isPosswork = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObsecure ? isPosswork : false,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        fillColor: ColorName.white.withOpacity(0.3),
        filled: true,
        errorStyle: const TextStyle(
          color: ColorName.redOrange,
        ),
        labelText: widget.hint,
        // floatingLabelStyle: const TextStyle(color: Colors.black54),
        suffixIcon: widget.isObsecure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPosswork = !isPosswork;
                  });
                },
                icon: Icon(
                  isPosswork ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
