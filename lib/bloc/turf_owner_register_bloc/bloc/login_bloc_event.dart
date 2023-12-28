part of 'login_bloc_bloc.dart';

sealed class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}
class LoginProcess extends LoginBlocEvent {
  final String? username;
  final String? password;
  const LoginProcess(
      {
      required this.username,
      
      required this.password,
      });
}

