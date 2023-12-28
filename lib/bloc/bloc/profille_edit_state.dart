part of 'profille_edit_bloc.dart';

sealed class ProfilleEditState extends Equatable {
  const ProfilleEditState();
  
  @override
  List<Object> get props => [];
}

final class ProfilleEditInitial extends ProfilleEditState {}
final class ProfilleEditLoading extends ProfilleEditState {}
final class ProfilleEditSuccess extends ProfilleEditState {}
final class ProfilleEditFailure extends ProfilleEditState {}
