import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({Key? key, required this.controller, required this.hint})
      : super(key: key);
  TextEditingController controller;
  String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 20.0),
        focusedErrorBorder: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
