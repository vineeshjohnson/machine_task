import 'package:flutter/material.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: 1'),
          Text('Name: Vineesh Johnson'),
          Text('Email: vineeshjohnson4545@gmail.com'),
        ],
      ),
    );
  }
}
