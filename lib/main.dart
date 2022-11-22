import 'package:flutter/material.dart';
import 'package:nearby_health_service/pages/splash_page.dart';
import 'package:nearby_health_service/providers/hospital_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HospitalProvider(),
        ),

      ],
      child: const MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
