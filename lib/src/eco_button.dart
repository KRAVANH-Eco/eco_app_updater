import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
  const EcoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
  });

  final String label;
  final Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CupertinoButton(
          padding: const EdgeInsets.all(0),
          color: Theme.of(context).primaryColor,
          child: Text(label),
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
