part of 'login_bloc_bloc.dart';

sealed class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

final class LoginBlocInitial extends LoginBlocState {}

final class LoginBlocLoading extends LoginBlocState {}

// ignore: must_be_immutable
final class LoginBlocSuccess extends LoginBlocState {
  UserTypeModel? userTypeModel;
  LoginBlocSuccess({required this.userTypeModel});
}

final class LoginBlocFailure extends LoginBlocState {}
