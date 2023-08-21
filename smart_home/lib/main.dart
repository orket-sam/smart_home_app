import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/grid_screen.dart';
import 'package:smart_home/home_screen.dart';
import 'package:smart_home/providers/homescreen_provider.dart';
import 'package:smart_home/providers/navigation_provider.dart';
import 'package:smart_home/search_devices_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPageIndex = context.watch<NavigationProvider>().selectedScreen;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFFB267),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: [
          const HomeScreen(),
          const SearchDevicesScreen(),
          const GridScreen(),
        ][selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: selectedPageIndex,
          onTap: (index) {
            context.read<NavigationProvider>().switchScreen(index);
          },
          unselectedItemColor: kGrey.withOpacity(0.6),
          backgroundColor: const Color(0xff221d1c),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: ''),
            // BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}
