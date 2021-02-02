import 'package:millaresfirebase/api//notifier/food_notifier.dart';
import 'package:millaresfirebase/screens/feed.dart';
import 'package:millaresfirebase/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/auth_notifier.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => AuthNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Back!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Feed() : Login();
        },
      ),
    );
  }
}
