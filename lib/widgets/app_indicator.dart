import 'package:flutter/material.dart';

class AppIndicatorFitessZone extends StatelessWidget {
  const AppIndicatorFitessZone({
    Key? key,
    this.color = Colors.blue,
    this.strokeWidth = 2.5,
    this.radius = 24,
  }) : super(key: key);
  final Color? color;
  final double strokeWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: radius,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
