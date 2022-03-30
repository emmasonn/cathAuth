import 'dart:async';

import 'package:catholic/managers/UserManager.dart';
import 'package:catholic/ui/login_page.dart';
import 'package:catholic/ui/register_page.dart';
import 'package:catholic/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  TextEditingController emailController = TextEditingController();
  String email = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
  }

  void checkEmail(String email) {
    if (email != '') {
      setState(() {
        isLoading = true;
      });
      final userState = Provider.of<UserManager>(context, listen: false)
          .checkIfUserExist(email);
      userState.then((value) {
        setState(() {
          isLoading = false;
        });
        if (value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Catholic Auth',
            )),
        body: (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      controller: emailController,
                      hint: 'Email Address',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () {
                            checkEmail(email);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const LoginPage()),
                            // );
                          },
                          padding: EdgeInsets.all(16.0),
                          color: Colors.blue,
                          child: const Text(
                            'Continue',
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
              ));
  }
}
