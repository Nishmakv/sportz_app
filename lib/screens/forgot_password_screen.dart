import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportz_app/bloc/bloc/user_forgot_password_bloc.dart';
import 'package:sportz_app/screens/login_screen.dart';
import 'package:sportz_app/widgets/button.dart';
import 'package:sportz_app/widgets/login_card.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCOntroller = TextEditingController();
    return BlocListener<UserForgotPasswordBloc, UserForgotPasswordState>(
      listener: (context, state) {
        if (state is UserForgotPasswordSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const LoginScreen(),
            ),
          );
        } else if (state is UserForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed'),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                LoginCard(
                    controller: emailCOntroller,
                    label: 'Email',
                    hint: 'Enter email address'),
                const SizedBox(height: 50),
                Button(
                  text: 'Continue',
                  onClick: () {
                    context.read<UserForgotPasswordBloc>().add(
                          UserForgotPasswordProcess(
                              email: emailCOntroller.text),
                        );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
