import 'package:flutter/material.dart';
import 'numerology_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(NumerologyApp());
}

class NumerologyApp extends StatelessWidget {
  const NumerologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Numeroloji Hesaplayıcı',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Color(0xFFA4825C),
          secondary: Color(0xFF846336),
          surface: Colors.grey[200]!,
          onSurface: Colors.grey[800]!,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Color(0xFFF5F1E8), 
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFA4825C),
          secondary: Colors.amber[800]!,
          surface: Colors.grey[900]!,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.grey[900], 
      ),
      themeMode: ThemeMode.system,
      home: NumerologyScreen(),
    );
  }
}