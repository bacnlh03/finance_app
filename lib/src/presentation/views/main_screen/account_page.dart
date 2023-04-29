import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Account',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 28,
        ),
        Text('Full name'),
        Text('email@gmail.com'),
        GestureDetector(
          onTap: () {},
          child: ListTile(
            title: Text('Change password'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: ListTile(
            title: Text('Logout'),
            trailing: Icon(
              Icons.logout,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
