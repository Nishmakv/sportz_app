import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/user_register_data_source.dart';
part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterDataSource user = UserRegisterDataSource();
  UserRegisterBloc() : super(UserRegisterInitial());
  @override
  Stream<UserRegisterState> mapEventToState(UserRegisterEvent event) async* {
    if (event is UserRegisterProcess) {
      yield* userRegisterSuccess(
          event.username, event.email, event.password, event.phonenumber);
    }
  }

  Stream<UserRegisterState> userRegisterSuccess(String? username, String? email,
      String? password, String? phonenumber) async* {
    yield UserRegisterLoading();
    final dataResponse = await user.userRegister(
      username: username,
      email: email,
      password: password,
      phonenumber: phonenumber,
      // abstract: 'helo',
    );
    print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield UserRegisterSuccess();
    } else {
      yield UserRegisterFailure();
    }
  }
}
