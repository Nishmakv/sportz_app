import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/login_data_source.dart';
import 'package:sportz_app/model.dart/user_type_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';
part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginDataSource user1 = LoginDataSource();
  SharedPrefs sharedPrefs = SharedPrefs();

  LoginBloc() : super(LoginBlocInitial());

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) async* {
    if (event is LoginProcess) {
      yield* loginSuccess(event.username, event.password);
    }
  }

  Stream<LoginBlocState> loginSuccess(
    String? username,
    String? password,
  ) async* {
    yield LoginBlocLoading();

    final dataResponse = await user1.userLogin(
      username: username,
      password: password,
    );
    print(dataResponse);
   

    if (dataResponse.token.isNotEmpty) {
      yield LoginBlocSuccess(userTypeModel: dataResponse);
    } else {
      yield LoginBlocFailure();
    }
  }
}
