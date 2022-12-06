import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'halloween candy game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<bool> visibility = [
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Current Score: $_counter'),
      ),
      backgroundColor: Color.fromARGB(255, 208, 114, 14),
      body: Center(
        child: Table(children: <TableRow>[
          TableRow(children: [
            buildSquare(0),
            buildSquare(1),
            buildSquare(2),
            buildSquare(3),
          ]),
          TableRow(children: [
            buildSquare(5),
            buildSquare(6),
            buildSquare(7),
            buildSquare(8),
          ]),
          TableRow(children: [
            buildSquare(5),
            buildSquare(6),
            buildSquare(7),
            buildSquare(8),
          ]),
          TableRow(children: [
            buildSquare(5),
            buildSquare(6),
            buildSquare(7),
            buildSquare(8),
          ]),
        ]),
      ),
    );
  }

  Widget buildSquare(int i) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (visibility[i]) {
              _counter++;
              for (int i = 0; i < 16; i++) {
                int invisible = 1 + Random().nextInt(2);
                if (i % invisible == 0) {
                  visibility[i] = !visibility[i];
                }
              }
              visibility[i] = false;
            }
          });
        },
        child: Card(
            child: Visibility(
                visible: visibility[i],
                child: SizedBox(
                    width: 175.0,
                    height: 175.0,
                    child: Image.asset("assets/download.png",
                        fit: BoxFit.fill)))));
  }
}
