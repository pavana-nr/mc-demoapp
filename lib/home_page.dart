import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterBloc, int>(builder: (context, counter) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      counterBloc.add(CounterIncremented());
                    },
                    child: const Text(
                      'Increment',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'SourceCodePro'),
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      counterBloc.add(CounterDecrement());
                    },
                    child: const Text(
                      'Decrement',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'SourceCodePro'),
                    )),
              ],
            ),
          ],
        ),
      );
    });
  }
}
