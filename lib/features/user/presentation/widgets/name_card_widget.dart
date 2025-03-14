import 'package:flutter/material.dart';
import 'package:user_app/features/user/data/models/user_model.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${user.id}'),
          Text('Name: ${user.firstname} ${user.lastname}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}
