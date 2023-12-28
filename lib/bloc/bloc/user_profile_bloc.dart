import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/profile_data_source.dart';
import 'package:sportz_app/model.dart/profile_model.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  ProfilelDataSource userProfile = ProfilelDataSource();
  UserProfileBloc() : super(UserProfileInitial());
  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is UserProfileProcess) {
      yield* getProfileSuccess();
    }
  }

  Stream<UserProfileState> getProfileSuccess() async* {
    yield UserProfileLoading();
     try {
      final dataResponse = await userProfile.getUserProfile();
      if (dataResponse.email.isNotEmpty) {
        yield UserProfileSuccess(userProfileModel: dataResponse);
      } else {
        yield UserProfileFailure();
      }
    } catch (e) {
      print(e);
      yield UserProfileFailure();
    }
  }
}
