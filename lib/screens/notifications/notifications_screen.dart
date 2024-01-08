import 'package:active_ally_fitness_zone_250/screens/notifications/font_sizer.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/reminder.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/water_widget.dart';
import 'package:flutter/material.dart';

int today = 0;
int goal = 0;

List<ReminderModel> listOfReminders = [];

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool switcher = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationsScreen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              textScaler: TextScaler.linear(FontSizer.textScaleFactor(context)),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'Don`t forget to drink water',
              textScaler: TextScaler.linear(FontSizer.textScaleFactor(context)),
              style: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            const WaterWidget(),
            const ReminderWidget()
          ],
        ),
      ),
    );
  }
}

class ReminderModel {
  final String time;
  final bool turnOn;

  ReminderModel({required this.time, required this.turnOn});
}
