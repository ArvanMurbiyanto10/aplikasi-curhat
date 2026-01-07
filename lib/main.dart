import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/landing_page.dart'; // <--- Panggil halaman depan dari folder pages

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      data: const DevicePreviewData(isVirtualKeyboardVisible: false),
      builder: (context) => const ArChatApp(),
    ),
  );
}

class ArChatApp extends StatelessWidget {
  const ArChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'ArChat - Teman Curhat AI',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF5D4037),
          secondary: Color(0xFFD7CCC8),
          surface: Color(0xFFFFF8F0),
          onPrimary: Colors.white,
          onSurface: Color(0xFF3E2723),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF5D4037)),
        ),
      ),
      home: const ArChatLandingPage(), // Memanggil class dari file terpisah
    );
  }
}
