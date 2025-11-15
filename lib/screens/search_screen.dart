// lib/screens/search_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../models/worker.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFF2C3E50),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.light),
      ),
      body: const WorkersScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF8B4513),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFD7CCC8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Navigator.pop(context);
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

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: const Color(0xFF2C3E50),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20), onPressed: () => Navigator.pop(context)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search workers...",
                      hintStyle: const TextStyle(color: Color(0xFF95A5A6)),
                      filled: true,
                      fillColor: const Color(0xFF34495E),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Featured Workers", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
          const SizedBox(height: 30),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('workers').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                if (snapshot.hasError) return Center(child: Text("Error: ${snapshot.error}"));
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text("No workers found"));

                final workers = snapshot.data!.docs.map((doc) => Worker.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: workers.length,
                  itemBuilder: (context, index) {
                    final worker = workers[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: WorkerCard(
                        name: worker.name,
                        profession: worker.profession,
                        experience: worker.experience,
                        rating: worker.rating,
                        locations: worker.location.join(" | "),
                        imageLeft: index % 2 == 0,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  final String name, profession, experience, locations;
  final double rating;
  final bool imageLeft;
  const WorkerCard({super.key, required this.name, required this.profession, required this.experience, required this.rating, required this.locations, required this.imageLeft});

  Widget _buildStars() {
    int full = rating.floor();
    bool hasHalf = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < full) return const Icon(Icons.star, color: Color(0xFFF4C519), size: 18);
        if (i == full && hasHalf) return const Icon(Icons.star_half, color: Color(0xFFF4C519), size: 18);
        return const Icon(Icons.star_border, color: Color(0xFFF4C519), size: 18);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rowChildren = imageLeft
        ? [
            ClipOval(child: Image.network("https://via.placeholder.com/120/4A90E2/FFFFFF?text=$name", width: 100, height: 100, fit: BoxFit.cover)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Years of Experience", style: TextStyle(fontSize: 13, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(experience, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.location_on, size: 16, color: Color(0xFF3498DB)),
                  const SizedBox(width: 4),
                  Text(locations, style: const TextStyle(fontSize: 14, color: Color(0xFF3498DB))),
                ]),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline, size: 18),
                  label: const Text("View Profile"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ]),
            ),
          ]
        : [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text("Years of Experience", style: TextStyle(fontSize: 13, color: Colors.black54), textAlign: TextAlign.right),
                const SizedBox(height: 4),
                Text(experience, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                const SizedBox(height: 4),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(locations, style: const TextStyle(fontSize: 14, color: Color(0xFF3498DB))),
                  const SizedBox(width: 4),
                  const Icon(Icons.location_on, size: 16, color: Color(0xFF3498DB)),
                ]),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline, size: 18),
                  label: const Text("View Profile"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ]),
            ),
            const SizedBox(width: 20),
            ClipOval(child: Image.network("https://via.placeholder.com/120/4A90E2/FFFFFF?text=$name", width: 100, height: 100, fit: BoxFit.cover)),
          ];

    return Column(
      children: [
        Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
        const SizedBox(height: 6),
        _buildStars(),
        const SizedBox(height: 4),
        Text(profession, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        const SizedBox(height: 20),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: rowChildren),
      ],
    );
  }
}