import 'package:finance_app/src/presentation/widgets/info_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const InfoCardWidget(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Recent transactions'),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(
                  'assets/test.png',
                  width: 40,
                ),
                title: const Text('Buy a villa'),
                subtitle: const Text('29/04/2023'),
                trailing: const Text('- 9,999,999 VND'),
              );
            },
          ),
        ),
      ],
    );
  }
}
