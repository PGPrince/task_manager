import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.menu, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello Prashanta!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Have a nice day.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _taskTab("My Tasks", selected: true),
                _taskTab("In-progress"),
                _taskTab("Completed"),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _projectCard("Front-End Development", "October 20, 2020"),
                  const SizedBox(width: 16),
                  _projectCard("Back-End Development", "October 24, 2020"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _progressTile(),
            const SizedBox(height: 12),
            _progressTile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        ],
      ),
    );
  }

  Widget _taskTab(String title, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget _projectCard(String title, String date) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(156, 44, 243, 1),
            Color.fromRGBO(58, 73, 249, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Project 1", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            date,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _progressTile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.calendar_month, color: Colors.white),
        ),
        title: Text("Design Changes"),
        subtitle: Text("2 Days ago"),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
