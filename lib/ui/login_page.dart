import 'package:catholic/managers/UserManager.dart';
import 'package:catholic/ui/register_page.dart';
import 'package:catholic/ui/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/user_model.dart';
import '../widget/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return buildLogin();
  }

  void loginUser() {
    setState(() {
      isLoading = true;
    });

    final user = User(
      email: '',
      phone: '',
      username: usernameController.text,
      password: passwordController.text,
    );
    final loginState =
        Provider.of<UserManager>(context, listen: false).loginUser(user);
    loginState.then((value) {
      setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDashboard(
            user: value,
          ),
        ),
      );
    });
  }

  Widget buildLogin() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Sign In')),
        body: (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      controller: usernameController,
                      hint: 'Username',
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    InputField(
                      controller: passwordController,
                      hint: 'password',
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () {
                            loginUser();
                          },
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.blue,
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
