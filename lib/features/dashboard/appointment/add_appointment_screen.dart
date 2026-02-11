import 'package:flutter/material.dart';
import 'package:hospital_reminder_app/services/notification_service.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final TextEditingController _doctor = TextEditingController();
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appointment Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _doctor,
              decoration: const InputDecoration(labelText: "Doctor name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              child: const Text("Pick Date"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_date == null || _doctor.text.isEmpty) return;

                NotificationService.schedule(
                  title: "Appointment Tomorrow",
                  body: "Visit Dr. ${_doctor.text}",
                  time: _date!.subtract(const Duration(days: 1)),
                );

                NotificationService.schedule(
                  title: "Appointment Today",
                  body: "Visit Dr. ${_doctor.text}",
                  time: _date!,
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
