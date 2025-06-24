import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_manager.dart';
import 'screens/home_page.dart';
import 'screens/task_calendar.dart';
import 'screens/create_task.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskManager(),
      child: const TaskManagerApp(),
    ),
  );
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF9C2CF3),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Task Manager'),
        '/calendar': (context) => const TaskCalendarPage(),
        '/create_task': (context) => const CreateTaskPage(),
      },
    );
  }
}
