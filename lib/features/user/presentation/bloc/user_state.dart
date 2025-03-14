part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserInitialFetchedState extends UserState {
  final List<UserModel> users;

  UserInitialFetchedState({required this.users});
}


final class UserCreatedState extends UserState{

}

final class LoadingState extends UserState{

}

final class ErrorState extends UserState{
  
}
