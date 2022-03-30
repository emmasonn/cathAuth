import 'package:catholic/network/user_model.dart';
import 'package:catholic/ui/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/UserManager.dart';
import '../widget/input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameControler = TextEditingController();
  bool isLoading = false;

  void registerUser() async {
    setState(() {
      isLoading = true;
    });

    final user = User(
      email: emailController.text,
      phone: phoneController.text,
      username: userNameControler.text,
      password: passwordController.text,
    );
    final userState =
        Provider.of<UserManager>(context, listen: false).signUpUser(user);
    userState.then((value) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputField(
                        controller: emailController,
                        hint: 'email',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      InputField(
                        controller: phoneController,
                        hint: 'phone',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      InputField(
                        controller: userNameControler,
                        hint: 'username',
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
                              registerUser();
                            },
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.blue,
                            child: const Text(
                              'Register',
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
      ),
    );
  }
}
