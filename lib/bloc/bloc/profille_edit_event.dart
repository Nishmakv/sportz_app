part of 'profille_edit_bloc.dart';

sealed class ProfilleEditEvent extends Equatable {
  const ProfilleEditEvent();

  @override
  List<Object> get props => [];
}

class ProfilleEditProcess extends ProfilleEditEvent {
  final File image;
  final String name;
  final String email;
  final String phoneNumber;
  
  
  const ProfilleEditProcess({required this.image,required this.name,required this.email,required this.phoneNumber});
}
