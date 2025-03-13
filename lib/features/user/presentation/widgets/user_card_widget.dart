import 'package:flutter/material.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/presentation/widgets/name_card_widget.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: AllColors().commonColor,
            borderRadius: BorderRadius.circular(5)),
        height: 150,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 60,
              ),
              NameCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}
