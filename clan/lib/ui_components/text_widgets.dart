import 'package:flutter/material.dart';

class PageHeadings extends StatelessWidget {
  String? text;

  PageHeadings({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        color: Color(0xFFD4D044),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

