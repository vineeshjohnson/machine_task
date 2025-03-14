import 'package:flutter/material.dart';
import 'package:user_app/core/common/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AllColors().textColor)),
      onPressed: onpress,
      child: Text(
        'Proceed',
        style: TextStyle(color: AllColors().backgroundColor),
      ),
    );
  }
}
