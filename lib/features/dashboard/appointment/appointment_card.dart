import 'package:flutter/material.dart';
import '/core/theme/widgets/app_card.dart';

class AppointmentCard extends StatelessWidget {
  final String doctor;
  final String date;

  const AppointmentCard({super.key, required this.doctor, required this.date});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          const Icon(Icons.calendar_month, size: 32),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dr. $doctor",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}
