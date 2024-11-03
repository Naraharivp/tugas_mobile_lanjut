import 'package:flutter/material.dart';
import 'pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Narahari_Project',
      debugShowCheckedModeBanner: false,  // Menghilangkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',  
      ),
      home: SplashScreen(),
    );
  }
}