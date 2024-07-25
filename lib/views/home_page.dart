import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_demoapp/bloc/auth_bloc.dart';

import '../custom_widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(authState.uid),
            ),
            Button(onPressed: () {}, label: 'Logout'),
          ],
        ),
      ),
    );
  }
}
