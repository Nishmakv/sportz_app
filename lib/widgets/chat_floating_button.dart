import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatFloatingButtonWidget extends StatelessWidget {
  const ChatFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          dynamic conversationObject = {
            'appId': '1eda1c7f246810f80f0346c8faae21e9f'
          };
          dynamic result = await KommunicateFlutterPlugin.buildConversation(
              conversationObject);
          print("Conversation builder success : " + result.toString());
        } on Exception catch (e) {
          print("Conversation builder error occurred : " + e.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 22, 191, 109),
          ),
          width: 40,
          height: 40,
          child:
              Lottie.asset('assets/animations/Animation - 1700678521518.json'),
        ),
      ),
    );
  }
}
