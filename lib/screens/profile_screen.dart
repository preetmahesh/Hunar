// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // ← ADD THIS LINE

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1E7),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFF1A2A44),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: const _ProfileBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF8B4513),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFD7CCC8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) Navigator.popUntil(context, (r) => r.isFirst);
          if (index == 1) Navigator.pushNamed(context, '/search');
          if (index == 2) Navigator.pushNamed(context, '/messages');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: const Color(0xFF1A2A44),
              child: Column(children: [
                Image.asset('assets/logo.png', width: 80, height: 80),
                const SizedBox(height: 10),
                Text('HUNAR', style: GoogleFonts.getFont('Abril Fatface', fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 3)),
                const Text('Your Job, Our Hunar', style: TextStyle(fontSize: 16, color: Colors.white70)),
              ]),
            ),
            const SizedBox(height: 30),
            const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=3')),
            const SizedBox(height: 12),
            const Text('Ibad Khan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
            const Text('Carpenter', style: TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Icon(Icons.phone, size: 18, color: Colors.black54),
              SizedBox(width: 6),
              Text('+92 333123456', style: TextStyle(fontSize: 15, color: Colors.black87)),
            ]),
            const SizedBox(height: 6),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Icon(Icons.email, size: 18, color: Colors.black54),
              SizedBox(width: 6),
              Text('ibadkhan@gmail.com', style: TextStyle(fontSize: 15, color: Colors.black87)),
            ]),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: const [
                Expanded(child: _StatCard(title: 'Total earnings', value: '12,320')),
                SizedBox(width: 16),
                Expanded(child: _StatCard(title: 'Number of orders', value: '42')),
              ]),
            ),
            const SizedBox(height: 30),
            _MenuTile(icon: Icons.edit, title: 'Edit Profile', onTap: () {}),
            _MenuTile(icon: Icons.credit_card, title: 'Payment', onTap: () {}),
            _MenuTile(icon: Icons.help_center, title: 'Help Center', onTap: () {}),
            _MenuTile(icon: Icons.history, title: 'Order History', onTap: () {}),
            _MenuTile(icon: Icons.settings, title: 'Settings', onTap: () {}),
            _MenuTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: const Color(0xFFF4F1EC),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.getFont('Abril Fatface', fontSize: 22, color: const Color(0xFF78350F)),
                    ),
                    content: const Text('Are you sure you want to logout?', style: TextStyle(fontSize: 16)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context), // Cancel → stay
                        child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false); // Go to Login
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF78350F)),
                        child: const Text('Logout', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title, value;
  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(color: const Color(0xFFF5E6D3), borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF8B4513))),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
      ]),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _MenuTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF8B4513)),
      title: Text(title, style: const TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: const Color(0xFFF5E6D3),
      dense: true,
    );
  }
}