// import 'package:dio/dio.dart';
// import 'package:sportz_app/model.dart/register_team_view.dart';

// class RegisterTeamListDataSource {
//   Dio client = Dio();

//   Future<List<RegisterTeamViewModel>>registerTeam() async {
//     List<RegisterTeamViewModel> registerTeamList = [];

//     final response = await client.get(
//       'http://13.126.57.93:8000/user/team_list',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       ),
//     );
//     (response.data as List).forEach((element) {
//       registerTeamList.add(RegisterTeamViewModel.fromJson(element));
//       print(element);
//     });

//     return registerTeamList;
//   }
// }
