import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({super.key, this.controller, this.icon, this.keyboardType, this.letterSpacing, this.wordSpacing, this.maxLength});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? icon;
  final double? letterSpacing;
  final double? wordSpacing;
  final int? maxLength;
  @override
  State<StatefulWidget> createState() {
    return _TextFieldCustom();
  }
}

class _TextFieldCustom extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(8)),
      child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(wordSpacing: widget.wordSpacing,
          letterSpacing: widget.letterSpacing,
          
          ),
          maxLength: widget.maxLength,
          decoration: InputDecoration(
              prefixIcon: widget.icon, border: InputBorder.none),
          enableSuggestions: true),
    );
  }
}
