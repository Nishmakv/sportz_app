part of 'user_profile_bloc.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

final class UserProfileInitial extends UserProfileState {}
final class UserProfileLoading extends UserProfileState {}

// ignore: must_be_immutable
final class UserProfileSuccess extends UserProfileState {
  UserProfileModel? userProfileModel;
  UserProfileSuccess({required this.userProfileModel});
}
final class UserProfileFailure extends UserProfileState {}
