import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/register_player_view_data_source.dart';
import 'package:sportz_app/model.dart/register_player_list_model.dart';

part 'register_player_list_event.dart';
part 'register_player_list_state.dart';

class RegisterPlayerListBloc
    extends Bloc<RegisterPlayerListEvent, RegisterPlayerListState> {
  RegisterPlayerListDataSource registerPlayers = RegisterPlayerListDataSource();
  RegisterPlayerListBloc() : super(RegisterPlayerListInitial());
  @override
  Stream<RegisterPlayerListState> mapEventToState(
      RegisterPlayerListEvent event) async* {
    if (event is RegisterPlayerProcess) {
      yield* getRegisterPlayer();
    }
  }

  Stream<RegisterPlayerListState> getRegisterPlayer() async* {
    yield RegisterPlayerListLoading();
    try {
      final dataResponse = await registerPlayers.registerPlayer();
      if (dataResponse.isNotEmpty) {
        yield RegisterPlayerListSuccess(registerPlayerList: dataResponse);
      } else {
        yield RegisterPlayerListFailure();
      }
    } catch (e) {
      print(e);
      yield RegisterPlayerListFailure();
    }
  }
}
