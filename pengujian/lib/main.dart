import 'package:flutter/material.dart';
import 'kotak_biru_jempol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  KotakBiruJempol(warna: Colors.blue, label: 'Biru'),
                  SizedBox(width: 16),
                  KotakBiruJempol(warna: Colors.green, label: 'Hijau'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  KotakBiruJempol(warna: Colors.orange, label: 'Oranye'),
                  SizedBox(width: 16),
                  KotakBiruJempol(warna: Colors.purple, label: 'Ungu'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}