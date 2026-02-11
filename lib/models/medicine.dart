class Medicine {
  final String id;
  final String name;
  final DateTime time;
  final String dosage; // optional but useful
  final bool isActive;

  Medicine({
    required this.id,
    required this.name,
    required this.time,
    this.dosage = '',
    this.isActive = true,
  });

  /// Convert object → Map (for Firebase / local DB later)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time.toIso8601String(),
      'dosage': dosage,
      'isActive': isActive,
    };
  }

  /// Convert Map → object
  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      time: DateTime.parse(map['time']),
      dosage: map['dosage'] ?? '',
      isActive: map['isActive'] ?? true,
    );
  }
}
