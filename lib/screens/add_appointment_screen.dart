import 'package:flutter/material.dart';
import '../services/notification_service.dart';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _doctor,
              decoration: const InputDecoration(labelText: "Doctor Name"),
            ),
            ElevatedButton(
              child: const Text("Pick Date"),
              onPressed: () async {
                _date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Set Reminder"),
              onPressed: () {
                // 1 day before
                NotificationService.scheduleNotification(
                  id: 2,
                  title: "Appointment Tomorrow",
                  body: "Appointment with Dr. ${_doctor.text}",
                  scheduledTime: _date!.subtract(const Duration(days: 1)),
                );

                // same day
                NotificationService.scheduleNotification(
                  id: 3,
                  title: "Appointment Today",
                  body: "Appointment with Dr. ${_doctor.text}",
                  scheduledTime: _date!,
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
