import 'package:flutter/material.dart';

class CustomInputTextField extends StatefulWidget {
  final ValueChanged onSubmitted;
  final String hintText;
  final String value;

  const CustomInputTextField({
    Key key,
    this.onSubmitted,
    this.hintText,
    this.value,
  }) : super(key: key);

  @override
  _CustomInputTextFieldState createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: TextField(
        onSubmitted: widget.onSubmitted,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
