import 'package:flutter/material.dart';
import '/core/theme/widgets/app_card.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String time;

  const MedicineCard({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          const Icon(Icons.medication, size: 32),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
