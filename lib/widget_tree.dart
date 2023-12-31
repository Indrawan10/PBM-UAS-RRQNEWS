import 'package:rrq_news/auth.dart';
import 'package:rrq_news/screens/home_screen.dart';
import 'package:rrq_news/screens/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  static const routeName = '/';

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
