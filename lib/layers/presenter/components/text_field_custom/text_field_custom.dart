import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({super.key, this.controller, this.icon});
  final TextEditingController? controller;
  final Widget? icon;

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
          decoration: InputDecoration(
              prefixIcon: widget.icon, border: InputBorder.none),
          enableSuggestions: true),
    );
  }
}
