import 'package:calculator/const.dart';
import 'package:flutter/material.dart';

class MYbutton extends StatefulWidget {
  final String value;
  final Color color;
  final VoidCallback onPress;
  const MYbutton(
      {super.key,
      required this.value,
      this.color = const Color(0xffa5a5a5),
      required this.onPress});

  @override
  State<MYbutton> createState() => _MYbuttonState();
}

class _MYbuttonState extends State<MYbutton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: InkWell(
          onTap: widget.onPress,
          child: Container(
            height: 80,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
            child: Center(
              child: Text(
                widget.value,
                style: headingTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
