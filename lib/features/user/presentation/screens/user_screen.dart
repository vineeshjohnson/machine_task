import 'package:flutter/material.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/presentation/widgets/headding_widget.dart';
import 'package:user_app/features/user/presentation/widgets/user_card_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors().textColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeaddingWidget(),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => UserCardWidget(),
                  separatorBuilder: (context, index) => Divider(
                        height: 15,
                      ),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
