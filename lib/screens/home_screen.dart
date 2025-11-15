// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1E7),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFF1A2A44),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: const ServicesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF8B4513),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFD7CCC8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/search');
          if (index == 2) Navigator.pushNamed(context, '/messages');
          if (index == 3) Navigator.pushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: const Color(0xFF1A2A44),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', width: 80, height: 80),
                  const SizedBox(height: 10),
                  const Text('HUNAR', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3)),
                  const Text('Your Job, Our Hunar', style: TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text('Our Services', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
            const Text('Explore our variety of available services', style: TextStyle(fontSize: 16, color: Colors.brown)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1.1,
                children: [
                  _serviceItem('assets/carpenter.png', 'Carpenters'),
                  _serviceItem('assets/maid.png', 'Maids'),
                  _serviceItem('assets/carwash.png', 'Car Wash'),
                  _serviceItem('assets/electrician.png', 'Electrician'),
                  _serviceItem('assets/pest.png', 'Pest Control'),
                  _serviceItem('assets/plumber.png', 'Plumbers'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('Coming\nSoon..', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black54)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _comingSoonItem('assets/painter.png'),
                const SizedBox(width: 30),
                _comingSoonItem('assets/ac_repair.png'),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _serviceItem(String assetPath, String title) => Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
              ),
              child: Padding(padding: const EdgeInsets.all(20), child: Image.asset(assetPath, fit: BoxFit.contain)),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
        ],
      );

  Widget _comingSoonItem(String assetPath) => Opacity(
        opacity: 0.4,
        child: Image.asset(assetPath, width: 100, height: 100, fit: BoxFit.contain),
      );
}