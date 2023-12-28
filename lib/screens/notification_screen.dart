import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Ionicons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 110,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: const Icon(Ionicons.person),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Request Message',
                            ),
                            Text(
                              'Anu send request to join your team',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text('5 min ago'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Deny',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Icon(Ionicons.person),
                        title: Text('Send a request to join your team'),
                        subtitle: Text('hello'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Icon(Ionicons.person),
                        title: Text('Send a request to join your team'),
                        subtitle: Text('hello'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Icon(Ionicons.person),
                        title: Text('Send a request to join your team'),
                        subtitle: Text('hello'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Icon(Ionicons.person),
                        title: Text('Send a request to join your team'),
                        subtitle: Text('hello'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
