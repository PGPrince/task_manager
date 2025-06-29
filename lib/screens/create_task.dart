// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import '../task_manager.dart';
// import 'package:uuid/uuid.dart';

// class CreateTaskPage extends StatefulWidget {
//   const CreateTaskPage({super.key});

//   @override
//   State<CreateTaskPage> createState() => _CreateTaskPageState();
// }

// class _CreateTaskPageState extends State<CreateTaskPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;
//   DateTime _selectedDate = DateTime.now();
//   String _selectedCategory = 'Design';

//   final List<String> _categories = [
//     'Design',
//     'Meeting',
//     'Coding',
//     'E2E',
//     'Testing',
//     'Quick call',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Create a Task')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(labelText: 'Task Name'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Enter a task name' : null,
//               ),
//               const SizedBox(height: 16),
//               Text('Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate)}'),
//               TextButton(
//                 onPressed: () async {
//                   DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: _selectedDate,
//                     firstDate: DateTime(2020),
//                     lastDate: DateTime(2025),
//                   );
//                   if (picked != null) {
//                     setState(() => _selectedDate = picked);
//                   }
//                 },
//                 child: const Text('Pick Date'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       final time = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                       );
//                       if (time != null) setState(() => _startTime = time);
//                     },
//                     child: Text(
//                       _startTime == null
//                           ? 'Start Time'
//                           : _startTime!.format(context),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final time = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                       );
//                       if (time != null) setState(() => _endTime = time);
//                     },
//                     child: Text(
//                       _endTime == null ? 'End Time' : _endTime!.format(context),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text('Category'),
//               Wrap(
//                 spacing: 10,
//                 children: _categories.map((cat) {
//                   final selected = _selectedCategory == cat;
//                   return ChoiceChip(
//                     label: Text(cat),
//                     selected: selected,
//                     onSelected: (_) => setState(() => _selectedCategory = cat),
//                     selectedColor: const Color(0xFF9C2CF3),
//                   );
//                 }).toList(),
//               ),
//               const Spacer(),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF9C2CF3),
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Provider.of<TaskManager>(context, listen: false).addTask(
//                         Task(
//                           id: const Uuid().v4(),
//                           title: _titleController.text,
//                           category: _selectedCategory,
//                           date: _selectedDate,
//                           startTime: _startTime,
//                           endTime: _endTime,
//                         ),
//                       );
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: const Text(
//                     'Create Task',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
