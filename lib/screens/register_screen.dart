import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/user_register_bloc.dart';
import 'package:sportz_app/screens/login_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void saveDetails(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserRegisterBloc, UserRegisterState>(
      listener: (context, state) {
        if (state is UserRegisterSuccess) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const LoginScreen(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        } else if (state is UserRegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // To prevent the screen from resizing when the keyboard appears
        body: BlocBuilder<UserRegisterBloc, UserRegisterState>(
          builder: (context, state) {
            if (state is UserRegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            }
            return Form(
              key: formkey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () => {
                                    Navigator.of(context)
                                        .pop(const LoginScreen())
                                  },
                              child: const Icon(Ionicons.arrow_back_outline)),
                          const SizedBox(width: 20),
                          const Text(
                            'Create an account',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xFF1B1B1F),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      LoginCard(
                        controller: usernameController,
                        label: 'Username',
                        hint: 'Enter full name',
                        validatorvar: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginCard(
                        controller: emailController,
                        label: 'Email Address',
                        hint: 'Enter email address',
                        validatorvar: false,
                      ),
                      const SizedBox(height: 10),
                      LoginCard(
                        controller: passwordController,
                        label: 'Password',
                        hint: 'Enter password',
                        obscureText: true,
                        password: true,
                        validatorvar: true,
                      ),
                      const SizedBox(height: 10),
                      LoginCard(
                          controller: phonenumberController,
                          label: 'Phone number',
                          hint: 'Enter phone number'),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        text: "Sign up",
                        onClick: () {
                          context.read<UserRegisterBloc>().add(
                                UserRegisterProcess(
                                    username: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phonenumber: phonenumberController.text),
                              );
                        },
                      ),
                      // const SizedBox(height: 15),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text(
                      //       "Are you a turf owner?",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 15,
                      //         color: Color.fromARGB(255, 110, 110, 112),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     TextButton(
                      //       onPressed: () {
                      //         PersistentNavBarNavigator.pushNewScreen(
                      //           context,
                      //           screen: const TurfOwnerRegisterScreen(),
                      //           withNavBar:
                      //               true, // OPTIONAL VALUE. True by default.
                      //           pageTransitionAnimation:
                      //               PageTransitionAnimation.cupertino,
                      //         );
                      //       },
                      //       child: const Text(
                      //         'Sign Up',
                      //         style: TextStyle(
                      //           fontSize: 15,
                      //           color: Colors.green,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
