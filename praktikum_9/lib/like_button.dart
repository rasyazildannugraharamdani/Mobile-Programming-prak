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
title: 'Like & Dislike',
home: LikeButtonPage(),
);
}
}

class LikeButtonPage extends StatefulWidget {
const LikeButtonPage({super.key});

@override
State<LikeButtonPage> createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {
bool _isLiked = false;
bool _isDisliked = false;

int _likeCount = 10;
int _dislikeCount = 5;

// Tombol Like
void _toggleLike() {
setState(() {
if (_isLiked) {
_likeCount--;
_isLiked = false;
} else {
if (_isDisliked) {
_dislikeCount--;
_isDisliked = false;
}

_likeCount++;
_isLiked = true;
}
});
}

// Tombol Dislike
void _toggleDislike() {
setState(() {
if (_isDisliked) {
_dislikeCount--;
_isDisliked = false;
} else {
if (_isLiked) {
_likeCount--;
_isLiked = false;
}

_dislikeCount++;
_isDisliked = true;
}
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Like & Dislike'),
backgroundColor: Colors.blue,
foregroundColor: Colors.white,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Apa pendapat kamu?',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 30),

Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// =========================
// LIKE - HATI
// =========================
Column(
children: [
IconButton(
onPressed: _toggleLike,
icon: Icon(
_isLiked
? Icons.favorite
    : Icons.favorite_border,
color: _isLiked ? Colors.red : Colors.grey,
size: 55,
),
),
Text(
'$_likeCount Likes',
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
],
),

const SizedBox(width: 50),

// =========================
// DISLIKE - HATI RETAK
// =========================
Column(
children: [
IconButton(
onPressed: _toggleDislike,
icon: Icon(
_isDisliked
? Icons.heart_broken
    : Icons.heart_broken_outlined,
color: _isDisliked ? Colors.red : Colors.grey,
size: 55,
),
),
Text(
'$_dislikeCount Dislikes',
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
],
),
],
),
],
),
),
);
}
}