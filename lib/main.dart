import 'package:flutter/material.dart';

import 'package:rrq_news/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'screens/screens.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD3z_krkeyO846TCuu_04mhwWkpAjQwrA4",
      appId: "1:1048603734662:android:255a2952a4788191e31707",
      messagingSenderId: "1048603734662",
      projectId: "rrqproject-cce84",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: WidgetTree(),
      initialRoute: '/',
      routes: {
        // WidgetTree.routeName: (context) => const WidgetTree(),
        // HomeScreen.routeName: (context) => const HomeScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
      },
    );
  }
}

// UI based on https://dribbble.com/shots/15193792-News-iOS-mobile-app/attachments/6937008?mode=media
