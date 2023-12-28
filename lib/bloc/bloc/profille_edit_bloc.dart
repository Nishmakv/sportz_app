import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/profile_update_data_source.dart';

part 'profille_edit_event.dart';
part 'profille_edit_state.dart';

class ProfilleEditBloc extends Bloc<ProfilleEditEvent, ProfilleEditState> {
  UpdateProfileDataSource updateProfileDataSource = UpdateProfileDataSource();
  ProfilleEditBloc() : super(ProfilleEditInitial());
   @override
  Stream<ProfilleEditState> mapEventToState(ProfilleEditEvent event) async* {
    if (event is ProfilleEditProcess) {
      yield* updateProfileSuccess( event.name,
          event.email, event.image, event.phoneNumber);
    }
  }
  Stream<ProfilleEditState> updateProfileSuccess(

      String? name,
      String? email,
      File? image,
   String?phoneNumber,
      
     ) async* {
    yield ProfilleEditLoading();
    final dataResponse = await updateProfileDataSource.editProfile(
      
        name: name,
        image: image,
        phoneNumber:phoneNumber,
        email: email, 
       );
    if (dataResponse.isNotEmpty) {
      yield ProfilleEditSuccess();
    } else {
      yield ProfilleEditFailure();
    }
  }

}
