import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/create_team_data_source.dart';
import 'package:sportz_app/model.dart/team_id_model.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  CreateTeamDataSource createTeam = CreateTeamDataSource();
  CreateTeamBloc() : super(CreateTeamInitial());
  @override
  Stream<CreateTeamState> mapEventToState(CreateTeamEvent event) async* {
    if (event is AddTeamProcess) {
      yield* addTeamSuccess(event.longitude, event.latitude, event.name,
          event.skill, event.image, event.strength);
    }
  }

  Stream<CreateTeamState> addTeamSuccess(
    double? longitude,
    double? latitide,
    String? name,
    String? skill,
    File? image,
    int? strength,
  ) async* {
    yield CreateTeamLoading();
    final dataResponse = await createTeam.addTeam(
      longitude: longitude,
      latitude: latitide,
      name: name,
      image: image,
      skill: skill,
      strength: strength,
    );
  
    if (dataResponse.id != null) {
      yield CreateTeamSuccess(teamById: dataResponse);
    } else {
      yield CreateTeamFailure();
    }
  }
}
