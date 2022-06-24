import 'package:flutter/material.dart';
import 'Fakultas.dart';
import 'Fasilitas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int idx = 0; //index yang aktif
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Info UPI")),
      body: case2(idx),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          selectedItemColor: Colors.red,
          onTap: onItemTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Fakultas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), label: "Fasilitas"),
          ]),
    ));
  }

  case2(int idx) {
    switch (idx) {
      case 0:
        {
          return const Fakultas();
        }

      case 1:
        {
          return Fasilitas();
        }
    }
  }
}
