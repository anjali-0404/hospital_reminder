import 'package:flutter/material.dart';
import 'package:hospital_reminder_app/services/notification_service.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController _name = TextEditingController();
  DateTime? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medicine Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: "Medicine name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  final now = DateTime.now();
                  _time = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    picked.hour,
                    picked.minute,
                  );
                }
              },
              child: const Text("Pick Time"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_time == null || _name.text.isEmpty) return;

                NotificationService.schedule(
                  title: "Medicine Reminder",
                  body: "Take ${_name.text}",
                  time: _time!,
                );

                Navigator.pop(context);
              },
              child: const Text("Save Reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
