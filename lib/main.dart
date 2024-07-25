import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_demoapp/bloc/counter_bloc.dart';
import 'package:mc_demoapp/cubit/todo_cubit.dart';

import 'bloc/auth_bloc.dart';
import 'cubit/counter_cubit.dart';
import 'views/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}
