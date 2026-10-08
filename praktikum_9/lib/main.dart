import 'dart:async';
import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return const MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Stateful Widget Demo',
home: CounterPage(),
);
}
}

class CounterPage extends StatefulWidget {
const CounterPage({super.key});

@override
State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
int _counter = 0;

Timer? _timer;

// Menambah counter
void _incrementCounter() {
setState(() {
_counter++;
});
}

// Mengurangi counter
void _decrementCounter() {
setState(() {
_counter--;
});
}

// Mulai tambah otomatis
void _startIncrement() {
_incrementCounter();

_timer?.cancel();

_timer = Timer.periodic(
const Duration(milliseconds: 100),
(timer) {
_incrementCounter();
},
);
}

// Mulai kurang otomatis
void _startDecrement() {
_decrementCounter();

_timer?.cancel();

_timer = Timer.periodic(
const Duration(milliseconds: 100),
(timer) {
_decrementCounter();
},
);
}

// Berhenti saat tombol dilepas
void _stopTimer() {
_timer?.cancel();
_timer = null;
}

@override
void dispose() {
_timer?.cancel();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Counter App'),
backgroundColor: Colors.blue,
foregroundColor: Colors.white,
),

body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Klik atau tahan tombol:',
style: TextStyle(fontSize: 24),
),

const SizedBox(height: 20),

Text(
'$_counter',
style: const TextStyle(
fontSize: 40,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 30),

Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// =========================
// TOMBOL KURANG
// =========================
GestureDetector(
onTap: _decrementCounter,
onLongPressStart: (_) {
_startDecrement();
},
onLongPressEnd: (_) {
_stopTimer();
},
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
foregroundColor: Colors.white,
minimumSize: const Size(110, 60),
),
onPressed: _decrementCounter,
child: const Text(
'Kurang',
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
),
),

const SizedBox(width: 16),

// =========================
// TOMBOL TAMBAH
// =========================
GestureDetector(
onTap: _incrementCounter,
onLongPressStart: (_) {
_startIncrement();
},
onLongPressEnd: (_) {
_stopTimer();
},
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
foregroundColor: Colors.white,
minimumSize: const Size(110, 60),
),
onPressed: _incrementCounter,
child: const Text(
'Tambah',
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
],
),
),
);
}
}
