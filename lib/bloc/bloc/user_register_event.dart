part of 'user_register_bloc.dart';

sealed class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterProcess extends UserRegisterEvent {
  final String username;
  final String email;
  final String password;
  final String phonenumber;
  const UserRegisterProcess({
    required this.username,
    required this.email,
    required this.password,
    required this.phonenumber,
  });
}
