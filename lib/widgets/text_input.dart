import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final handleInput;
  final String palceHolder;
  final Widget icon;
  const TextInput(this.icon, this.palceHolder, this.handleInput, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: handleInput,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
        ),
        hintText: palceHolder,
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
        prefixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff1c6dd0), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff1c6dd0)),
        ),
      ),
    );
  }
}
