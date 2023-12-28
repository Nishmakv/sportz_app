part of 'bloc_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterProcess extends RegisterEvent {
  final String? organizationname;
  final String? username;
  final String? email;
  final String? password;
  final String? phonenumber;
  const RegisterProcess(
      {required this.organizationname,
      required this.username,
      required this.email,
      required this.password,
      required this.phonenumber});
}
