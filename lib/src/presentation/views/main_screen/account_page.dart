import 'package:finance_app/src/presentation/bloc/auth/auth_state.dart';
import 'package:finance_app/src/presentation/views/credential/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        const CircleAvatar(
          radius: 28,
        ),
        const Text('Full name'),
        const Text('email@gmail.com'),
        GestureDetector(
          onTap: () {
            
          },
          child: const ListTile(
            title: Text('Change password'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<AuthCubit>(context).loggedOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
          child: const ListTile(
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
