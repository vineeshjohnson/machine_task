import 'package:flutter/material.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/presentation/screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User App',
        theme: ThemeData(
          fontFamily: 'poppins',
            primaryColor: AllColors().textColor,
            secondaryHeaderColor: AllColors().commonColor),
        home: const UserScreen());
  }
}
