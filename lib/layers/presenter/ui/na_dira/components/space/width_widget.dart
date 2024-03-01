import 'package:flutter/material.dart';

class WidthWidget extends StatelessWidget {
  final double? width;
  // ignore: use_key_in_widget_constructors
  const WidthWidget([this.width]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 12.0,
    );
  }
}
