import 'package:flutter/material.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/view/event.dart';
import 'package:the_internet_folks/view/home.dart';
import 'package:the_internet_folks/view/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'the_internet_folks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
      ),
      initialRoute: '/event',
      routes: {
        '/home': (context) => const Home(),
        '/event': (context) => const Event(
              eventName: 'eve',
            ),
        '/search': (context) => const Search(),
      },
    );
  }
}
