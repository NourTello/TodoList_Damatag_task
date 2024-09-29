import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_damatag_task/core/themes/light-theme.dart';

import 'core/functions/bloc_observer.dart';
import 'features/tasks/presentation/screens/home_screen.dart';

void main() {
  Bloc.observer =  MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MY TODOLIST ',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}

