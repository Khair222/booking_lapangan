import 'package:flutter/material.dart';
import '../models.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'check_booking_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  User? _user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ambil arguments dari route jika belum ada
    if (_user == null) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is User) {
        _user = args;
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List halaman yang akan ditampilkan
    final List<Widget> pages = [
      HomeScreen(user: _user),
      const HistoryScreen(),
      const CheckBookingScreen(),
      ProfileScreen(user: _user),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff0A3A67),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cek Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
