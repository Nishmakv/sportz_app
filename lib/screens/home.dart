import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/gallery_get_bloc.dart';
import 'package:sportz_app/screens/gallery_screen.dart';
import 'package:sportz_app/screens/home_tab.dart';
import 'package:sportz_app/screens/login_screen.dart';
import 'package:sportz_app/screens/profile_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/screens/register_team_view_screen.dart';
import 'package:sportz_app/screens/turf_screen.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/widgets/chat_floating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userToken;
  SharedPrefs preference = SharedPrefs();
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  int selectedIndex = 0;

  Icon icon = const Icon(Icons.search);

  @override
  void initState() {
    userToken1();

    super.initState();
  }

  void userToken1() async {
    await preference.getToken('userToken').then((value) {
      setState(() {
        userToken = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        bottomOpacity: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/1700474236855.948.jpg',
          width: 65,
          height: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(width: 5),
                userToken!.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ProfileScreen(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: const Icon(
                          Ionicons.person_outline,
                          size: 28,
                          color: Colors.black,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const LoginScreen(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: const Icon(
                          Ionicons.log_in_outline,
                          size: 28,
                          color: Colors.black,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          HomeTab(controller: _controller), // Move it inside the build method
          const TurfScreen(),
          const TeamListScreen(),
          const GalleryScreen(),
        ],
        navBarStyle: NavBarStyle.style3,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(microseconds: 1),
        ),
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Ionicons.home, size: 23),
            inactiveIcon: const Icon(Ionicons.home_outline, size: 23),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Ionicons.football, size: 23),
            inactiveIcon: const Icon(Ionicons.football_outline, size: 23),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Ionicons.people, size: 23),
            inactiveIcon: const Icon(Ionicons.people_outline, size: 23),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Ionicons.image, size: 23),
            inactiveIcon: const Icon(Ionicons.image_outline, size: 23),
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        backgroundColor: Colors.white,
        onItemSelected: (int index) {
          context.read<GalleryGetBloc>().add(
                const GetImageProcess(),
              );
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: const SizedBox(
        height: 100,
        width: 100,
        child: ChatFloatingButtonWidget(),
      ),
    );
  }
}
