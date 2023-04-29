import 'package:finance_app/src/presentation/views/main_screen/account_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/home_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/statistics_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [
    HomePage(),
    StatisticsPage(),
    StatisticsPage(),
    AccountPage(),
  ];
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.home),
                    Visibility(
                      visible: _currentPage == 0,
                      child: const Text('Home'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.home),
                    Visibility(
                      visible: _currentPage == 1,
                      child: const Text('Home'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.home),
                    Visibility(
                      visible: _currentPage == 2,
                      child: const Text('Home'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.home),
                    Visibility(
                      visible: _currentPage == 3,
                      child: const Text('Home'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: pages[_currentPage],
          ),
        ),
      ),
    );
  }
}
