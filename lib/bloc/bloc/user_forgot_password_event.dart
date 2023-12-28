part of 'user_forgot_password_bloc.dart';

sealed class UserForgotPasswordEvent extends Equatable {
  const UserForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class UserForgotPasswordProcess extends UserForgotPasswordEvent {
 
  final String email;
 
  const UserForgotPasswordProcess({
  
    required this.email,
   
  });
}
