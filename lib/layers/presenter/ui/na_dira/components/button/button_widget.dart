import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool expanded;
  final Color? color;

  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      this.color,
      this.expanded = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.color ?? Colors.grey.shade700),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.expanded
          ? SizedBox(
              width: double.infinity,
              child: Center(child: widget.child),
            )
          : Center(child: widget.child),
    );
  }
}
