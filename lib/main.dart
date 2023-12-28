import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportz_app/bloc/bloc/add_new_player_bloc.dart';
import 'package:sportz_app/bloc/bloc/bloc/add_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/booking_history_bloc.dart';
import 'package:sportz_app/bloc/bloc/booking_success_bloc.dart';
import 'package:sportz_app/bloc/bloc/create_team_bloc.dart';
import 'package:sportz_app/bloc/bloc/delete_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/gallery_bloc.dart';
import 'package:sportz_app/bloc/bloc/gallery_get_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_each_player_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_one_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_user_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/invite_players_bloc.dart';
import 'package:sportz_app/bloc/bloc/player_leaderboard_bloc.dart';
import 'package:sportz_app/bloc/bloc/profille_edit_bloc.dart';
import 'package:sportz_app/bloc/bloc/register_player_list_bloc.dart';
import 'package:sportz_app/bloc/bloc/search_turf_name_bloc.dart';
import 'package:sportz_app/bloc/bloc/team_leaderboard_bloc.dart';
import 'package:sportz_app/bloc/bloc/turf_book_bloc.dart';
import 'package:sportz_app/bloc/bloc/user_forgot_password_bloc.dart';
import 'package:sportz_app/bloc/bloc/user_profile_bloc.dart';
import 'package:sportz_app/bloc/bloc/user_register_bloc.dart';
import 'package:sportz_app/bloc/turf_owner_register_bloc/bloc/login_bloc_bloc.dart';
import 'package:sportz_app/bloc/turf_owner_register_bloc/bloc_bloc.dart';
import 'package:sportz_app/screens/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RegisterBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => UserRegisterBloc(),
      ),
      BlocProvider(
        create: (context) => AddTurfBloc(),
      ),
      BlocProvider(
        create: (context) => GetTurfBloc(),
      ),
      BlocProvider(
        create: (context) => DeleteTurfBloc(),
      ),
      BlocProvider(
        create: (context) => GalleryBloc(),
      ),
      BlocProvider(
        create: (contex) => GalleryGetBloc(),
      ),
      BlocProvider(
        create: (context) => CreateTeamBloc(),
      ),
      BlocProvider(
        create: (contex) => UserProfileBloc(),
      ),
      BlocProvider(
        create: (context) => TurfBookBloc(),
      ),
      BlocProvider(
        create: (context) => GetUserTurfBloc(),
      ),
      BlocProvider(
        create: (context) => GetOneTurfBloc(),
      ),
      BlocProvider(
        create: (context) => TeamLeaderboardBloc(),
      ),
      BlocProvider(
        create: (context) => GetPlayersBloc(),
      ),
      BlocProvider(
        create: (context) => GetEachPlayerBloc(),
      ),
      BlocProvider(
        create: (context) => AddNewPlayerBloc(),
      ),
      BlocProvider(
        create: (context) => PlayerLeaderboardBloc(),
      ),
      BlocProvider(
        create: (context) => BookingSuccessBloc(),
      ),
      BlocProvider(
        create: (context) => UserForgotPasswordBloc(),
      ),
      BlocProvider(
        create: (context) => ProfilleEditBloc(),
      ),
      BlocProvider(
        create: (context) => RegisterPlayerListBloc(),
      ),
      BlocProvider(
        create: (context) => SearchTurfNameBloc(),
      ),
      BlocProvider(
        create: (context) => InvitePlayersBloc(),
      ),
      BlocProvider(
        create: (context) => BookingHistoryBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 16, 181, 22),
          ),
          textTheme: GoogleFonts.dmSansTextTheme(),
          scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
