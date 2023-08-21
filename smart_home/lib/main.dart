import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/providers/homescreen_provider.dart';

import 'home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFFB267)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
