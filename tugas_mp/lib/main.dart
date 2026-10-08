
import 'package:flutter/material.dart';

void main() {
runApp(const DataMahasiswaApp());
}

class DataMahasiswaApp extends StatelessWidget {
const DataMahasiswaApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Data Mahasiswa',
theme: ThemeData(
useMaterial3: true,
fontFamily: 'Roboto',
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF087F5B),
),
),
home: const FormMahasiswaPage(),
);
}
}

// ============================================================
// HALAMAN FORM
// ============================================================

class FormMahasiswaPage extends StatefulWidget {
const FormMahasiswaPage({super.key});

@override
State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
final TextEditingController namaController = TextEditingController();
final TextEditingController nimController = TextEditingController();
final TextEditingController tanggalController = TextEditingController();

String? programStudi;

final List<String> daftarProdi = [
'Teknik Informatika',
'Teknik Elektro',
'Sistem Informasi',
'Manajemen',
'Matematika',
];

@override
void dispose() {
namaController.dispose();
nimController.dispose();
tanggalController.dispose();
super.dispose();
}

// ============================================================
// PILIH TANGGAL
// ============================================================

Future<void> pilihTanggal() async {
DateTime? tanggal = await showDatePicker(
context: context,
initialDate: DateTime(2006, 1, 1),
firstDate: DateTime(1980),
lastDate: DateTime.now(),
);

if (tanggal != null) {
setState(() {
tanggalController.text =
'${tanggal.day} ${namaBulan(tanggal.month)} ${tanggal.year}';
});
}
}

String namaBulan(int bulan) {
const namaBulan = [
'Januari',
'Februari',
'Maret',
'April',
'Mei',
'Juni',
'Juli',
'Agustus',
'September',
'Oktober',
'November',
'Desember',
];

return namaBulan[bulan - 1];
}

// ============================================================
// SUBMIT
// ============================================================

void submitData() {
if (namaController.text.isEmpty ||
nimController.text.isEmpty ||
tanggalController.text.isEmpty ||
programStudi == null) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Mohon lengkapi semua data terlebih dahulu!',
),
),
);
return;
}

Navigator.push(
context,
MaterialPageRoute(
builder: (context) => HasilMahasiswaPage(
nama: namaController.text,
nim: nimController.text,
tanggalLahir: tanggalController.text,
programStudi: programStudi!,
),
),
);
}

// ============================================================
// BUILD FORM
// ============================================================

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF2F7F5),
body: SafeArea(
child: SingleChildScrollView(
child: Column(
children: [

// ==================================================
// HEADER
// ==================================================

Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB(25, 35, 25, 30),
decoration: const BoxDecoration(
color: Color(0xFF087F5B),
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(35),
bottomRight: Radius.circular(35),
),
),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Row(
children: [
CircleAvatar(
radius: 25,
backgroundColor: Colors.white,
child: Icon(
Icons.school,
color: Color(0xFF087F5B),
size: 28,
),
),

SizedBox(width: 15),

Text(
'Form Mahasiswa',
style: TextStyle(
color: Colors.white,
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
],
),

SizedBox(height: 22),

Text(
'Lengkapi Data Diri',
style: TextStyle(
color: Colors.white,
fontSize: 27,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 7),

Text(
'Silakan masukkan informasi mahasiswa dengan benar.',
style: TextStyle(
color: Color(0xFFD8F3E8),
fontSize: 14,
),
),
],
),
),

// ==================================================
// FORM
// ==================================================

Padding(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

const Text(
'Informasi Mahasiswa',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
color: Color(0xFF1F2937),
),
),

const SizedBox(height: 5),

const Text(
'Isi semua kolom di bawah ini.',
style: TextStyle(
color: Colors.grey,
fontSize: 13,
),
),

const SizedBox(height: 20),

// ==========================================
// NAMA
// ==========================================

const Text(
'Nama Lengkap',
style: TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
color: Color(0xFF374151),
),
),

const SizedBox(height: 8),

TextField(
controller: namaController,
decoration: InputDecoration(
hintText: 'Contoh: Ahmad Fauzan',
prefixIcon: const Icon(
Icons.person,
color: Color(0xFF087F5B),
),
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(
vertical: 16,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),
borderSide: BorderSide.none,
),
),
),

const SizedBox(height: 18),

// ==========================================
// NIM
// ==========================================

const Text(
'Nomor Induk Mahasiswa',
style: TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
color: Color(0xFF374151),
),
),

const SizedBox(height: 8),

TextField(
controller: nimController,
keyboardType: TextInputType.number,
decoration: InputDecoration(
hintText: 'Masukkan NIM',
prefixIcon: const Icon(
Icons.credit_card,
color: Color(0xFF087F5B),
),
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(
vertical: 16,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),
borderSide: BorderSide.none,
),
),
),

const SizedBox(height: 18),

// ==========================================
// TANGGAL LAHIR
// ==========================================

const Text(
'Tanggal Lahir',
style: TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
color: Color(0xFF374151),
),
),

const SizedBox(height: 8),

TextField(
controller: tanggalController,
readOnly: true,
onTap: pilihTanggal,
decoration: InputDecoration(
hintText: 'Pilih tanggal lahir',
prefixIcon: const Icon(
Icons.calendar_today,
color: Color(0xFF087F5B),
),
suffixIcon: const Icon(
Icons.keyboard_arrow_down,
color: Colors.grey,
),
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(
vertical: 16,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),
borderSide: BorderSide.none,
),
),
),

const SizedBox(height: 18),

// ==========================================
// PROGRAM STUDI
// ==========================================

const Text(
'Program Studi',
style: TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
color: Color(0xFF374151),
),
),

const SizedBox(height: 8),

Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(
horizontal: 15,
),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(12),
),
child: DropdownButtonHideUnderline(
child: DropdownButton<String>(
value: programStudi,
isExpanded: true,
hint: const Row(
children: [
Icon(
Icons.school_outlined,
color: Color(0xFF087F5B),
),
SizedBox(width: 12),
Text(
'Pilih program studi',
style: TextStyle(
color: Colors.grey,
),
),
],
),
icon: const Icon(
Icons.keyboard_arrow_down,
),
items: daftarProdi.map((String prodi) {
return DropdownMenuItem<String>(
value: prodi,
child: Row(
children: [
const Icon(
Icons.school_outlined,
color: Color(0xFF087F5B),
),
const SizedBox(width: 12),
Text(prodi),
],
),
);
}).toList(),
onChanged: (value) {
setState(() {
programStudi = value;
});
},
),
),
),

const SizedBox(height: 30),

// ==========================================
// TOMBOL SUBMIT
// ==========================================

SizedBox(
width: double.infinity,
height: 55,
child: ElevatedButton(
onPressed: submitData,
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF087F5B),
foregroundColor: Colors.white,
elevation: 2,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(14),
),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.save_outlined),
SizedBox(width: 10),
Text(
'Simpan Data',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
],
),
),
),

const SizedBox(height: 15),

const Center(
child: Text(
'Pastikan data yang dimasukkan sudah benar',
style: TextStyle(
color: Colors.grey,
fontSize: 12,
),
),
),
],
),
),
],
),
),
),
);
}
}

// ============================================================
// HALAMAN HASIL
// ============================================================

class HasilMahasiswaPage extends StatelessWidget {
final String nama;
final String nim;
final String tanggalLahir;
final String programStudi;

const HasilMahasiswaPage({
super.key,
required this.nama,
required this.nim,
required this.tanggalLahir,
required this.programStudi,
});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF2F7F5),

// ========================================================
// APP BAR
// ========================================================

appBar: AppBar(
backgroundColor: const Color(0xFFF2F7F5),
elevation: 0,
leading: IconButton(
icon: const Icon(
Icons.arrow_back_ios_new,
size: 20,
),
onPressed: () {
Navigator.pop(context);
},
),
title: const Text(
'Detail Mahasiswa',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
),

// ========================================================
// BODY
// ========================================================

body: SingleChildScrollView(
padding: const EdgeInsets.all(20),
child: Column(
children: [

// ==================================================
// CARD SUKSES
// ==================================================

Container(
width: double.infinity,
padding: const EdgeInsets.all(25),
decoration: BoxDecoration(
color: const Color(0xFF087F5B),
borderRadius: BorderRadius.circular(25),
),
child: Column(
children: [

Container(
width: 70,
height: 70,
decoration: const BoxDecoration(
color: Colors.white,
shape: BoxShape.circle,
),
child: const Icon(
Icons.check_circle_outline,
color: Color(0xFF087F5B),
size: 42,
),
),

const SizedBox(height: 15),

const Text(
'Data Berhasil Disimpan',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.white,
fontSize: 21,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 6),

const Text(
'Informasi mahasiswa telah diterima.',
textAlign: TextAlign.center,
style: TextStyle(
color: Color(0xFFD8F3E8),
fontSize: 13,
),
),
],
),
),

const SizedBox(height: 25),

// ==================================================
// JUDUL
// ==================================================

const Align(
alignment: Alignment.centerLeft,
child: Text(
'Data Anda',
style: TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
color: Color(0xFF1F2937),
),
),
),

const SizedBox(height: 15),

// ==================================================
// DATA
// ==================================================

DataCard(
icon: Icons.person,
label: 'Nama Lengkap',
value: nama,
),

const SizedBox(height: 12),

DataCard(
icon: Icons.credit_card,
label: 'NIM',
value: nim,
),

const SizedBox(height: 12),

DataCard(
icon: Icons.calendar_today,
label: 'Tanggal Lahir',
value: tanggalLahir,
),

const SizedBox(height: 12),

DataCard(
icon: Icons.school,
label: 'Program Studi',
value: programStudi,
),

const SizedBox(height: 20),

// ==================================================
// TOMBOL KEMBALI
// ==================================================

SizedBox(
width: double.infinity,
height: 52,
child: OutlinedButton(
onPressed: () {
Navigator.pop(context);
},
style: OutlinedButton.styleFrom(
foregroundColor: const Color(0xFF087F5B),
side: const BorderSide(
color: Color(0xFF087F5B),
),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(13),
),
),
child: const Text(
'Kembali ke Form',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
),
),
],
),
),
);
}
}

// ============================================================
// CARD DATA
// ============================================================

class DataCard extends StatelessWidget {
final IconData icon;
final String label;
final String value;

const DataCard({
super.key,
required this.icon,
required this.label,
required this.value,
});

@override
Widget build(BuildContext context) {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 8,
offset: const Offset(0, 3),
),
],
),
child: Row(
children: [

// ICON
Container(
width: 48,
height: 48,
decoration: BoxDecoration(
color: const Color(0xFFE1F3EC),
borderRadius: BorderRadius.circular(13),
),
child: Icon(
icon,
color: const Color(0xFF087F5B),
),
),

const SizedBox(width: 15),

// TEXT
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Text(
label,
style: const TextStyle(
color: Colors.grey,
fontSize: 12,
),
),

const SizedBox(height: 5),

Text(
value,
style: const TextStyle(
color: Color(0xFF1F2937),
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
],
),
),
],
),
);
}
}

