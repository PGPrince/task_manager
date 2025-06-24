import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String title;
  String category;
  DateTime date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    this.startTime,
    this.endTime,
    this.isCompleted = false,
  });
}

class TaskManager extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: const Uuid().v4(),
      title: 'Design Changes',
      category: 'Design',
      date: DateTime(2020, 10, 24),
      startTime: const TimeOfDay(hour: 13, minute: 22),
      endTime: const TimeOfDay(hour: 15, minute: 20),
    ),
  ];

  List<Task> get tasks => _tasks;
  List<Task> get inProgressTasks =>
      _tasks.where((task) => !task.isCompleted).toList();
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}
