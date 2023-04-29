import 'package:finance_app/src/presentation/bloc/auth/auth_state.dart';
import 'package:finance_app/src/presentation/bloc/credential/credential_state.dart';
import 'package:finance_app/src/presentation/bloc/user/get_single_user/get_single_user_cubit.dart';
import 'package:finance_app/src/presentation/views/credential/sign_in_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/account_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/home_page.dart';
import 'package:finance_app/src/presentation/views/main_screen/main_screen.dart';
import 'package:finance_app/src/presentation/views/main_screen/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_app/src/core/dependency_injector.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<GetSingleUserCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance App',
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const MainScreen();
                } else {
                  return const SignInPage();
                }
              },
            );
          },
          '/home': (context) => const HomePage(),
          '/statistics': (context) => const StatisticsPage(),
          '/account': (context) => const AccountPage(),
        },
      ),
    );
  }
}
