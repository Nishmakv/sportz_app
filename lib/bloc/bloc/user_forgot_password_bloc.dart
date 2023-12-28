import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/user_forgot_password_data_source.dart';

part 'user_forgot_password_event.dart';
part 'user_forgot_password_state.dart';

class UserForgotPasswordBloc
    extends Bloc<UserForgotPasswordEvent, UserForgotPasswordState> {
  UserForgotPasswordDataSource userForgotPassword =
      UserForgotPasswordDataSource();
  UserForgotPasswordBloc() : super(UserForgotPasswordInitial());
   @override
  Stream<UserForgotPasswordState> mapEventToState(UserForgotPasswordEvent event) async* {
    if (event is UserForgotPasswordProcess) {
      yield* userForgotPasswordSuccess(
         event.email);
    }
  }
   Stream<UserForgotPasswordState> userForgotPasswordSuccess( String? email) async* {
    yield UserForgotPasswordLoading();
    final dataResponse = await userForgotPassword.userForgotPassword(
     
      email: email,
    
  
    );
    print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield UserForgotPasswordSuccess();
    } else {
      yield UserForgotPasswordFailure();
    }
  }


}
