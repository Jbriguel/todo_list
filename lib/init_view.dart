import 'package:flutter/material.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/views/authentification/login_view/login_view.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return LoginView(); //MyHomePage(title: 'Flutter Demo Home Page');
          }
        });
  }
}
