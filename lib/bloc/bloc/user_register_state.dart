part of 'user_register_bloc.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();
  
  @override
  List<Object> get props => [];
}

final class UserRegisterInitial extends UserRegisterState {}
final class UserRegisterLoading extends UserRegisterState{}
final class UserRegisterSuccess extends UserRegisterState{}
final class UserRegisterFailure extends UserRegisterState{}
