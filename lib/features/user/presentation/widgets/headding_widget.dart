import 'package:flutter/material.dart';

class HeaddingWidget extends StatelessWidget {
  const HeaddingWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
