import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_internet_folks/constants.dart';
import 'package:the_internet_folks/view/event.dart';
import 'package:the_internet_folks/view/home.dart';
import 'package:the_internet_folks/view/search.dart';
import 'package:the_internet_folks/view_model/response_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ResponseViewModel()),
      ],
      child: const MyApp(),
    ),
  );
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(
              viewName: "Home",
            ),
        '/event': (context) => const Event(
              viewName: "Event",
              id: 0,
            ),
        '/search': (context) => const Search(
              viewName: "Search",
            ),
      },
    );
  }
}
