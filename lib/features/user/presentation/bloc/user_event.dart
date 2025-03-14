part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserFetchEvent extends UserEvent {
  final int pagenumber;

  UserFetchEvent({required this.pagenumber});
}

class NextPageFetchEvent extends UserEvent {
  final int pagenumber;

  NextPageFetchEvent({required this.pagenumber});
}

class UserClickedEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  final String name;
  final String job;

  AddUserEvent({required this.name, required this.job});
}
