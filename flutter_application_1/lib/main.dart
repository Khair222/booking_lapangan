import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/check_booking_screen.dart';
import 'screens/topup_screen.dart';
import 'screens/main_screen.dart';
import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const SportBookingApp());
}

class SportBookingApp extends StatelessWidget {
  const SportBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Lapangan',
      debugShowCheckedModeBanner: false,
      theme: buildBlueTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/history': (context) => const HistoryScreen(),
        '/check-booking': (context) => const CheckBookingScreen(),
        '/topup': (context) => const TopUpScreen(),
      },
    );
  }
}

