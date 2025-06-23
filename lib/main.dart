import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:task_management/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.transparent,
        nextScreen: MyHomePage(title: "Task Manager"),
        splashIconSize: double.infinity,
        splash: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(156, 44, 243, 1),
                Color.fromRGBO(58, 73, 249, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(Icons.task, size: 300, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
