import 'package:flutter/material.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/presentation/screens/user_screen.dart';
import 'package:workmanager/workmanager.dart';

import 'core/services/sync_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask(
    "syncTask",
    "syncUsersTask",
    frequency: const Duration(minutes: 15), // Sync every 15 minutes
  );

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
