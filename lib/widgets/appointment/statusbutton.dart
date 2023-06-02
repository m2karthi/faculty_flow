import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final Widget child;
  var color;
  StatusButton({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
          child: child,
        ));
  }
}
