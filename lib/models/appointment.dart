class Appointment {
  final String id;
  final String doctorName;
  final DateTime date;
  final String department;
  final String notes;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.date,
    this.department = '',
    this.notes = '',
  });

  /// Convert object → Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorName': doctorName,
      'date': date.toIso8601String(),
      'department': department,
      'notes': notes,
    };
  }

  /// Convert Map → object
  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      doctorName: map['doctorName'],
      date: DateTime.parse(map['date']),
      department: map['department'] ?? '',
      notes: map['notes'] ?? '',
    );
  }
}
