// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../task_manager.dart';
// import 'package:intl/intl.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedTab = 0;

//   @override
//   Widget build(BuildContext context) {
//     final taskManager = Provider.of<TaskManager>(context);
//     final tasks = _selectedTab == 0
//         ? taskManager.tasks
//         : _selectedTab == 1
//         ? taskManager.inProgressTasks
//         : taskManager.completedTasks;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Hello Prashanta!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Have a nice day.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _tabButton('My Tasks', 0),
//                 _tabButton('In-progress', 1),
//                 _tabButton('Completed', 2),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _projectBox('Front-End\nDevelopment', 'Oct 20, 2020'),
//                 _projectBox('Back-End\nDevelopment', 'Oct 24, 2020'),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text('Progress', style: TextStyle(fontSize: 20)),
//             ...tasks.map(
//               (task) => ListTile(
//                 leading: const Icon(
//                   Icons.description,
//                   color: Color(0xFF9C2CF3),
//                 ),
//                 title: Text(task.title),
//                 subtitle: Text(DateFormat('MMM dd, yyyy').format(task.date)),
//                 trailing: Checkbox(
//                   value: task.isCompleted,
//                   onChanged: (_) => taskManager.toggleTaskCompletion(task.id),
//                   activeColor: const Color(0xFF9C2CF3),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         onTap: (index) {
//           if (index == 1) Navigator.pushNamed(context, '/calendar');
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
//         ],
//       ),
//     );
//   }

//   //
//   Widget _tabButton(String title, int index) {
//     return GestureDetector(
//       onTap: () => setState(() => _selectedTab = index),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: _selectedTab == index ? Colors.purple : Colors.grey,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _projectBox(String text, String date) {
//     return Container(
//       width: 150,
//       height: 150,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         gradient: const LinearGradient(
//           colors: [Color(0xFF9C2CF3), Color(0xFF3A49F9)],
//         ),
//       ),
//       child: Center(
//         child: Text(
//           '$text\n$date',
//           textAlign: TextAlign.center,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
