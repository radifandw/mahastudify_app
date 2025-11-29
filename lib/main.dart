import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'student/student_main_page.dart'; // ⬅️ halaman utama pelajar

void main() {
  runApp(const MahastudifyApp());
}

class MahastudifyApp extends StatelessWidget {
  const MahastudifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahastudify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthPage(),
        '/studentMain': (context) => const StudentMainPage(), // pelajar
        // nanti kalau UI pengajar sudah siap, baru tambah route tutor di sini
      },
    );
  }
}
