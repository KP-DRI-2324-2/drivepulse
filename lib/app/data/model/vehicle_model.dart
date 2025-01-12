import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  String? id; // Tambahkan ID untuk referensi Firestore
  final String name;
  final String manufacturer;
  final String model;
  final int year;
  final String type;
  final int displacement;

  Vehicle({
    this.id,
    required this.name,
    required this.manufacturer,
    required this.model,
    required this.year,
    required this.type,
    required this.displacement,
  });

  // Dari Firestore
  factory Vehicle.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Vehicle(
      id: doc.id,
      name: data['name'] ?? '',
      manufacturer: data['manufacturer'] ?? '',
      model: data['model'] ?? '',
      year: data['year'] ?? 0,
      type: data['type'] ?? '',
      displacement: data['displacement'] ?? 0,
    );
  }

  // Ke Map untuk Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'manufacturer': manufacturer,
      'model': model,
      'year': year,
      'type': type,
      'displacement': displacement,
    };
  }
}
