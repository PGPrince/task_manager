import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const IconData customAccountIcon = IconData(
  0xe043,
  fontFamily: 'MaterialIcons',
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 12.0,
              left: 8.0,
              right: 14.0,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, size: 40.0, color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(customAccountIcon, size: 40.0, color: Colors.black),
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Prashanta!",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Have a nice day.",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text("Progress"),
        ),
      ),
    );
  }
}
