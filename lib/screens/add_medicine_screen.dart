import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController _medicineName = TextEditingController();
  DateTime? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medicine Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _medicineName,
              decoration: const InputDecoration(labelText: "Medicine Name"),
            ),
            ElevatedButton(
              child: const Text("Pick Time"),
              onPressed: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  final now = DateTime.now();
                  _time = DateTime(
                      now.year, now.month, now.day, picked.hour, picked.minute);
                }
              },
            ),
            ElevatedButton(
              child: const Text("Set Reminder"),
              onPressed: () {
                NotificationService.scheduleNotification(
                  id: 1,
                  title: "Medicine Reminder",
                  body: "Time to take ${_medicineName.text}",
                  scheduledTime: _time!,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
