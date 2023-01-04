import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late TextEditingController Controller;
  TextInputType textInputType;
  String hint;
  bool obscureText;
  Icon icon;
  IconButton? iconButton;

  CustomTextField(this.Controller, this.hint, this.textInputType, this.icon,
      [this.obscureText = false, this.iconButton]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (String? x){
          if(x == null || x.isEmpty){
            return 'this field the required';
          }
        },
        obscureText: obscureText,
        controller: Controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: iconButton,
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }
}
