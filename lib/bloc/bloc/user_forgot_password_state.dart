part of 'user_forgot_password_bloc.dart';

sealed class UserForgotPasswordState extends Equatable {
  const UserForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

final class UserForgotPasswordInitial extends UserForgotPasswordState {}
final class UserForgotPasswordLoading extends UserForgotPasswordState {}

final class UserForgotPasswordSuccess extends UserForgotPasswordState {}

final class UserForgotPasswordFailure extends UserForgotPasswordState {}

