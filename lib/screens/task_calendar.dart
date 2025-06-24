import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../task_manager.dart';

class TaskCalendarPage extends StatefulWidget {
  const TaskCalendarPage({super.key});

  @override
  State<TaskCalendarPage> createState() => _TaskCalendarPageState();
}

class _TaskCalendarPageState extends State<TaskCalendarPage> {
  DateTime _selectedDate = DateTime(2020, 10, 24);

  @override
  Widget build(BuildContext context) {
    final taskManager = Provider.of<TaskManager>(context);
    final tasksForDate = taskManager.tasks
        .where((task) => isSameDate(task.date, _selectedDate))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Calendar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFF9C2CF3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(_selectedDate),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null) setState(() => _selectedDate = picked);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Mo'),
                Text('Tu'),
                Text('We'),
                Text('Th'),
                Text('Fr'),
                Text('Sa'),
                Text('Su'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: tasksForDate.length,
              itemBuilder: (context, index) {
                final task = tasksForDate[index];
                return ListTile(
                  leading: const Icon(
                    Icons.description,
                    color: Color(0xFF9C2CF3),
                  ),
                  title: Text(task.title),
                  subtitle: Text(
                    '${DateFormat('MMM dd, yyyy').format(task.date)} ${task.startTime?.format(context) ?? ''} - ${task.endTime?.format(context) ?? ''}',
                  ),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => taskManager.toggleTaskCompletion(task.id),
                    activeColor: const Color(0xFF9C2CF3),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9C2CF3),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.pushNamed(context, '/create_task'),
      ),
    );
  }

  bool isSameDate(DateTime d1, DateTime d2) =>
      d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
}
