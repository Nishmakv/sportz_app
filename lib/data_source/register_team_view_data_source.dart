import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/register_team_view.dart';

class RegisterTeamViewDataSource {
  Dio client = Dio();

  Future<List<RegisterTeamViewModel>> getPlayers() async {
    List<RegisterTeamViewModel> registerTeamView = [];

    final response = await client.get(
      'http://13.126.57.93:8000/user/team_list/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print(response);
    // print('data:$turfModel');
    (response.data['data'] as List).forEach((element) {
      registerTeamView.add(RegisterTeamViewModel.fromJson(element));
      print(element);
    });

    return registerTeamView;
  }
}
