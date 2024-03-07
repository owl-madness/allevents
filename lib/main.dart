import 'package:allevents/controller/category_provider.dart';
import 'package:allevents/controller/explore_controller.dart';
import 'package:allevents/controller/main_screen_provider.dart';
import 'package:allevents/screen/explore_screen.dart';
import 'package:allevents/screen/feed_screen.dart';
import 'package:allevents/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenProvider()),
      ChangeNotifierProvider(create: (context) => ExploreController()),
      ChangeNotifierProvider(create: (context) => CategoryController()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
