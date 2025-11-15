// lib/screens/messages_screen.dart
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2A44),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text('Messages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: const [
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=1', name: 'Junaid Raza', message: 'Raasty mein hun sir', time: '10:30 AM'),
          SizedBox(height: 12),
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=5', name: 'Aleena Hayat', message: 'Please rate 5 stars!!!', time: '9:45 AM'),
          SizedBox(height: 12),
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=8', name: 'Hamza Ali', message: 'Can we reschedule our meeting?', time: 'Yesterday'),
          SizedBox(height: 12),
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=12', name: 'Hammad Khan', message: 'Ye nahi ata muja', time: 'Yesterday'),
          SizedBox(height: 12),
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=15', name: 'Shahveer', message: 'Youre welcome', time: '2 days ago'),
          SizedBox(height: 12),
          ChatTile(imageUrl: 'https://i.pravatar.cc/150?img=20', name: 'Saleem khan', message: 'Waiting 4 ur reply', time: '3 days ago'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF8B4513),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFD7CCC8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Navigator.popUntil(context, (r) => r.isFirst);
          if (index == 1) { Navigator.pop(context); Navigator.pushNamed(context, '/search'); }
          if (index == 3) Navigator.pushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String imageUrl, name, message, time;
  const ChatTile({super.key, required this.imageUrl, required this.name, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFFF5E6D3), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipOval(child: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
              const SizedBox(height: 4),
              Text(message, style: const TextStyle(fontSize: 14, color: Colors.black54), maxLines: 1, overflow: TextOverflow.ellipsis),
            ]),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}