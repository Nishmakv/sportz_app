

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sportz_app/data_source/turf_register_data_source.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterDataSource user = RegisterDataSource();
  RegisterBloc() : super(RegisterInitial());
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterProcess) {
      yield* registerSuccess(event.organizationname, event.username,
          event.email, event.password, event.phonenumber);
    }
  }

  Stream<RegisterState> registerSuccess(
      String? organizationname,
      String? username,
      String? email,
      String? password,
      String? phonenumber) async* {
    yield RegisterLoading();

    final dataResponse = await user.turfOwnerRegister(
        organizationname: organizationname,
        username: username,
        email: email,
        password: password,
        phonenumber: phonenumber);
         print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield RegisterSuccess();
    } else {
      yield RegisterFailure();
    }
  }
}
