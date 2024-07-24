import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, counter) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter:$counter',
                  style: const TextStyle(
                      color: Colors.amber,
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      counterCubit.increment();
                    },
                    child: const Text(
                      'Increment',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'SourceCodePro'),
                    )),
              ],
            ),
          );
        });
  }
}
