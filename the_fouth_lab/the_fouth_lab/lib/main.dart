import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeError) {
            return Scaffold(
              backgroundColor: const Color(0xFF121212),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _incrementCounter();
                            _incrementCounter();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(
                                ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _decrementCounter();
                            _decrementCounter();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(
                                ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      _counter.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ]),
              floatingActionButton: Container(
                width: 100,
                height: 100,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: FittedBox(
                          child: Text(
                        'Смена темы',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                    onPressed: () {
                      BlocProvider.of<ThemeCubit>(context).changeTheme(true);
                    },
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF121212),
                          shape: const CircleBorder(
                              // side: BorderSide.circular(100.0),
                              ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _decrementCounter();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF121212),
                          shape: const CircleBorder(
                              // side: BorderSide.circular(100.0),
                              ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    _counter.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ]),
            floatingActionButton: Container(
              width: 100,
              height: 100,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF121212),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: FittedBox(child: Text('Смена темы')),
                  ),
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).changeTheme(false);
                  },
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
