import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:user_app/core/database/database.dart';
import 'package:user_app/features/user/data/models/user_model.dart';
import 'package:user_app/features/user/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<UserFetchEvent>((event, emit) async {
      List<UserModel> users = await getUser(event.pagenumber);
      emit(UserInitialFetchedState(users: users));
    });

    on<NextPageFetchEvent>((event, emit) async {
      List<UserModel> users = await getUser(event.pagenumber);
      emit(UserInitialFetchedState(users: users));
    });

    on<AddUserEvent>((event, emit) async {
      bool response = await createUser(event.name, event.job);
      response ? emit(UserCreatedState(response: response)) : emit(ErrorState());
    });
  }
}

Future<List<UserModel>> getUser(int page) {
  UserRepository userRepository = UserRepository();
  var users = userRepository.fetchUsers(page);
  return users;
}

Future<bool> createUser(String name, String job) async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (!connectivityResult.contains(ConnectivityResult.mobile)&&!connectivityResult.contains(ConnectivityResult.wifi)) {
    final AppDatabase db = AppDatabase();

    await db.insertUser(
      name,
      job,
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      const SnackBar(content: Text("Saved offline! Will sync when online.")),
    );
    return false;
  } else {
    UserRepository userRepository = UserRepository();
    final response = await userRepository.createUser(name, job);
    return response;
  }
}
