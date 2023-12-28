import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/turf_owner_register_bloc/bloc/login_bloc_bloc.dart';
import 'package:sportz_app/model.dart/user_type_model.dart';
import 'package:sportz_app/screens/home.dart';
import 'package:sportz_app/screens/register_screen.dart';
import 'package:sportz_app/screens/turf_owner/turf_owner_home_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String? name;
  UserTypeModel? userTypeModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
      listener: (context, state) {
        if (state is LoginBlocSuccess) {
          userTypeModel = state.userTypeModel;
          setState(() {});
          print('nishma');
          if (userTypeModel?.userType == 'owner') {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const TurfOwnerHome(),
           
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const HomeScreen(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        } else if (state is LoginBlocFailure) {
          print('sruthy');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // To prevent the screen from resizing when the keyboard appears
        body: BlocBuilder<LoginBloc, LoginBlocState>(
          builder: (context, state) {
            if (state is LoginBlocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, Welcome back!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Color(0xFF1B1B1F),
                            height: 2,
                          ),
                        ),
                        const Text(
                          "Hello again you've been missed",
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(height: 40),
                        LoginCard(
                          controller: emailController,
                          label: 'Username',
                          hint: 'Enter email address',
                          validatorvar: false,
                        ),
                        LoginCard(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Enter password',
                          obscureText: true,
                          forgotPassword: true,
                          password: true,
                          validatorvar: true,
                        ),
                        const SizedBox(height: 20),
                        Button(
                          text: "Login",
                          onClick: () {
                            print('nishma');

                            context.read<LoginBloc>().add(LoginProcess(
                                username: emailController.text,
                                password: passwordController.text));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromARGB(255, 110, 110, 112),
                          ),
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const RegisterScreen(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
