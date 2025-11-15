// lib/models/worker.dart
class Worker {
  final String id;
  final String name;
  final String profession;
  final String experience;
  final double rating;
  final List<String> location;
  final String? phone;
  final String? email;
  final int totalEarnings;
  final int numberOfOrders;

  Worker({
    required this.id,
    required this.name,
    required this.profession,
    required this.experience,
    required this.rating,
    required this.location,
    this.phone,
    this.email,
    this.totalEarnings = 0,
    this.numberOfOrders = 0,
  });

  factory Worker.fromFirestore(Map<String, dynamic> data, String id) {
    return Worker(
      id: id,
      name: data['name'] ?? 'No Name',
      profession: data['profession'] ?? 'Worker',
      experience: data['experience'] ?? '0 years',
      rating: (data['rating'] ?? 0.0).toDouble(),
      location: List<String>.from(data['location'] ?? []),
      phone: data['phone'],
      email: data['email'],
      totalEarnings: data['total_earnings'] ?? 0,
      numberOfOrders: data['number_of_orders'] ?? 0,
    );
  }
}