import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/user/data/models/user_model.dart';
import 'package:user_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:user_app/features/user/presentation/screens/add_user_screen.dart';
import 'package:user_app/features/user/presentation/widgets/headding_widget.dart';
import 'package:user_app/features/user/presentation/widgets/user_card_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> user = [];
    int pagenumber = 1;
    return BlocProvider(
      create: (context) =>
          UserBloc()..add(UserFetchEvent(pagenumber: pagenumber)),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserInitialFetchedState) {
            user = state.users;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AllColors().textColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  HeaddingWidget(
                    title: 'User List',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            UserCardWidget(user: user[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: user.length),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pagenumber == 1) {
                        pagenumber++;
                      } else {
                        pagenumber--;
                      }
                      context
                          .read<UserBloc>()
                          .add(NextPageFetchEvent(pagenumber: pagenumber));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pagenumber == 1
                            ? Icon(Icons.skip_next)
                            : Icon(Icons.skip_previous_sharp),
                        pagenumber == 1 ? Text('Next') : Text('Prevoiuse')
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddUserScreen()));
              },
              backgroundColor: AllColors().textColor,
              child: Icon(
                Icons.add,
                color: AllColors().backgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
