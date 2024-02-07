import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String text;
  
  const AppTitle({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
