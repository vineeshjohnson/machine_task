import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      response ? emit(UserCreatedState()) : emit(ErrorState());
    });
  }
}

Future<List<UserModel>> getUser(int page) {
  UserRepository userRepository = UserRepository();
  var users = userRepository.fetchUsers(page);
  return users;
}

Future<bool> createUser(String name, String job) async {
  UserRepository userRepository = UserRepository();
  final response = await userRepository.createUser(name, job);
  return response;
}
