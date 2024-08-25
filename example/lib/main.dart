import 'package:flutter/material.dart';
import 'package:swipe_recognizer/swipe_recognizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeRecognizer(
         onSwipeLeft: () {
            setState(() {
              counter++;
            });
          },
          onSwipeRight: () {
            setState(() {
              counter--;
            });
          },
        child: Container(
          color: Colors.blue,
          child: Center(
              child: Text(
                '$counter',
                style: const TextStyle(fontSize: 48),
              ),
            ),
        ),
      ),
    );
  }
}
