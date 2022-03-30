import 'package:catholic/managers/UserManager.dart';
import 'package:catholic/managers/user_repository.dart';
import 'package:catholic/network/catholic_service.dart';
import 'package:catholic/ui/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late UserRepository repository;

void main() {
  repository = UserRepository(CatholicService());
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => UserManager(repository)),
      child: MaterialApp(
          title: 'Catholic Auth',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: OnBoard()),
    );
  }
}
