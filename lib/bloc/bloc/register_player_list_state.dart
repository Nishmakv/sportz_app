part of 'register_player_list_bloc.dart';

sealed class RegisterPlayerListState extends Equatable {
  const RegisterPlayerListState();

  @override
  List<Object> get props => [];
}

final class RegisterPlayerListInitial extends RegisterPlayerListState {}

final class RegisterPlayerListLoading extends RegisterPlayerListState {}

// ignore: must_be_immutable
final class RegisterPlayerListSuccess extends RegisterPlayerListState {
  List<RegisterPlayerList> registerPlayerList = [];
  RegisterPlayerListSuccess({required this.registerPlayerList});
}

final class RegisterPlayerListFailure extends RegisterPlayerListState {}
