import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/screens/forgot_password_screen.dart';

// ignore: must_be_immutable
class LoginCard extends StatefulWidget {
  final TextEditingController controller;
  String label;
  String hint;
  bool obscureText;
  bool forgotPassword;
  bool password;
  bool validatorvar;
  bool isNumeric;

  LoginCard({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.forgotPassword = false,
    this.password = false,
    this.validatorvar = false,
    this.isNumeric = false,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();

}

class _LoginCardState extends State<LoginCard> {
  bool _obscureText = true;
  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1F),
                      fontSize: 14,
                    ),
                  ),
                  widget.forgotPassword
                      ? TextButton(
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                ],
              ),
              widget.forgotPassword
                  ? const SizedBox(
                      height: 0,
                    )
                  : const SizedBox(height: 12),
              SizedBox(
                height: 53,
                child: TextFormField(
                  controller: widget.controller,
                  validator: (value) {
                    if (widget.validatorvar == false &&
                        widget.forgotPassword == false) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return "invalid email";
                      }
                    } else if (widget.validatorvar == true &&
                        widget.isNumeric) {
                      // Check if it's numeric
                      if (value!.isEmpty || !isNumeric(value)) {
                        return "invalid numeric input";
                      }
                    } else if (widget.validatorvar == true &&
                        widget.obscureText == true) {
                      if (value!.isEmpty || value.length < 6) {
                        return "invalid password";
                      }
                    }
                  },
                  // initialValue: widget.initialValue,
                  obscureText: widget.obscureText,
                  keyboardType: widget.isNumeric ? TextInputType.number : null,
                  inputFormatters: widget.isNumeric
                      ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                      : null, // Allow only numeric input
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(7)),
                    fillColor: const Color.fromARGB(255, 249, 248, 248),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 244, 240, 240), width: 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    // helperText: 'Enter Email',
                    hintText: widget.hint,
                    contentPadding: const EdgeInsets.all(22),
                    hintStyle: const TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: widget.password
                        ? IconButton(
                            color: const Color.fromARGB(114, 10, 10, 10),
                            icon: Icon(_obscureText
                                ? Ionicons.eye_off_outline
                                : Ionicons.eye_outline),
                            onPressed: () {
                              setState(
                                () {
                                  widget.obscureText = !widget.obscureText;
                                  _obscureText = !_obscureText;
                                },
                              );
                            },
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
