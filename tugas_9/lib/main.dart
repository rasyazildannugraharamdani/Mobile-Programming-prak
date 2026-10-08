import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatefulWidget {
const MyApp({super.key});

@override
State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
late ValueNotifier<double> _valueNotifier;
late double counter;

@override
void initState() {
super.initState();

_valueNotifier = ValueNotifier(0.0);
counter = 0.0;
}

@override
void dispose() {
_valueNotifier.dispose();
super.dispose();
}

void incrementCounter() {
setState(() {
if (counter < 33) {
counter++;
_valueNotifier.value = (counter / 33) * 100;
}
});
}

void resetCounter() {
setState(() {
counter = 0.0;
_valueNotifier.value = 0.0;
});
}

@override
Widget build(BuildContext context) {
SystemChrome.setSystemUIOverlayStyle(
const SystemUiOverlayStyle(
statusBarColor: Colors.transparent,
),
);

return MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: const Color.fromARGB(255, 119, 210, 145),
),
useMaterial3: true,
),
home: Scaffold(
backgroundColor: const Color.fromARGB(255, 119, 210, 145),
body: SafeArea(
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

// Judul
const Text(
'Tasbih Digital',
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

// Keterangan jumlah
Text(
'${counter.round()} / 33',
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.w500,
),
),

const SizedBox(height: 10),

SimpleCircularProgressBar(
progressColors: [
Colors.amberAccent.shade400,
],
size: 300,
progressStrokeWidth: 20,
backStrokeWidth: 10,
mergeMode: true,
maxValue: 100,
animationDuration: 0,
valueNotifier: _valueNotifier,
onGetText: (value) {
return Text(
'${(value.toInt() / 3).round()}',
style: const TextStyle(
fontSize: 170,
),
);
},
),

const SizedBox(height: 30),

// Pesan ketika mencapai 33
if (counter == 33)
const Text(
'Alhamdulillah, selesai 33x',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 30),

// Tombol fingerprint
ClipRRect(
borderRadius: const BorderRadius.all(
Radius.circular(50),
),
child: InkWell(
onTap: incrementCounter,
child: Container(
decoration: const BoxDecoration(
color: Colors.white,
),
child: const Icon(
Icons.fingerprint,
size: 125,
),
),
),
),
],
),
),
),

// Tombol reset
floatingActionButton: FloatingActionButton(
onPressed: resetCounter,
child: const Icon(
Icons.refresh_outlined,
),
),
),
);
}
}
