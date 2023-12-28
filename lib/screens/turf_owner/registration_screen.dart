import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/turf_owner_register_bloc/bloc_bloc.dart';
import 'package:sportz_app/screens/login_screen.dart';
import 'package:sportz_app/screens/turf_owner/turf_add_screen.dart';
import 'package:sportz_app/screens/turf_owner/turf_location_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

// ignore: must_be_immutable
class TurfOwnerRegisterScreen extends StatefulWidget {
  const TurfOwnerRegisterScreen({super.key});

  @override
  State<TurfOwnerRegisterScreen> createState() =>
      _TurfOwnerRegisterScreenState();
}

class _TurfOwnerRegisterScreenState extends State<TurfOwnerRegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController organisationController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isChecked = false;

  void saveDetails(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          setState(() {});
        }
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => LoginScreen(),
            ),
          );
          setState(() {});
        } else if (state is RegisterFailure) {
          print('failed');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        body: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            }
            return Form(
              key: formkey,
              child: SingleChildScrollView(
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
                              'Register your business',
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
                            controller: organisationController,
                            label: 'Organization name',
                            hint: 'Enter organisation name here'),
                        const SizedBox(
                          height: 10,
                        ),
                        LoginCard(
                          controller: usernameController,
                          label: 'Username',
                          hint: 'Enter Username',
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
                        const SizedBox(
                          height: 10,
                        ),
                        LoginCard(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Enter password',
                          obscureText: true,
                          password: true,
                          validatorvar: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        LoginCard(
                            controller: phonenumberController,
                            label: 'Phone number',
                            hint: 'Enter phone number'),
                        const SizedBox(
                          height: 30,
                        ),
                        Button(
                          onClick: () {
                            context.read<RegisterBloc>().add(
                                  RegisterProcess(
                                      organizationname:
                                          organisationController.text,
                                      username: usernameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phonenumber: phonenumberController.text),
                                );
                          },
                          text: "Register",
                        ),
                      ],
                    ),
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
