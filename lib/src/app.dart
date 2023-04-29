import 'package:finance_app/src/presentation/views/credential/sign_in_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/account_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/home_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/main_screen.dart';
import 'package:finance_app/src/presentation/views/main_screen/statistics_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const SignInPage();
        },
        '/home': (context) => const HomePage(),
        '/statistics': (context) => const StatisticsPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
