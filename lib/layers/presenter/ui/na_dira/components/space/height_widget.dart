import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  final double? height;
  // ignore: use_key_in_widget_constructors
  const HeightWidget([this.height]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 12.0,
    );
  }
}
