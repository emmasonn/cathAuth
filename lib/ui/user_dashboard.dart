import 'package:flutter/material.dart';

import '../network/post_model.dart';

class UserDashboard extends StatelessWidget {
  UserDashboard({Key? key, required this.user}) : super(key: key);
  One user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Welcome to Dashboard',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 72,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              user.email ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              user.phone ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
