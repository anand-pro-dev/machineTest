import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Train {
  final String name;
  final int startTimeVT; // Start time in VT (minutes)
  final int frequencyVT; // Frequency in VT (minutes)
  final int endTimeVT; // End time in VT (minutes)

  Train(this.name, this.startTimeVT, this.frequencyVT, this.endTimeVT);
}

class TrainScheduleScreen extends StatelessWidget {
  final currentTimeVT = 17 * 60; // 5:00 PM in VT (minutes)
  final now = DateTime.now();

  final trains = [
    Train('Central Station', 0, 20, 24 * 60),
    Train('Circular', 0, 60, 24 * 60),
    Train('North Square', 60, 12, 22 * 60),
    Train('West Market', 90, 6, 90 + 60),
    Train('Central Station', 120, 30, 24 * 60),
    Train('Circular', 150, 20, 24 * 60),
    Train('North Square', 180, 15, 24 * 60),
    Train('West Market', 210, 45, 24 * 60),
    Train('Central Station', 240, 10, 24 * 60),
    Train('Circular', 270, 25, 24 * 60),
    Train('North Square', 300, 8, 22 * 60),
    Train('West Market', 330, 18, 24 * 60),
    Train('Central Station', 360, 40, 24 * 60),
    Train('Circular', 390, 35, 24 * 60),
    Train('North Square', 420, 50, 24 * 60),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTimeFormatted = DateFormat.Hm().format(now);
    final timeLeftVT = currentTimeVT - (now.hour * 60 + now.minute);
    final timeLeftMinutes = timeLeftVT < 0 ? timeLeftVT + 24 * 60 : timeLeftVT;

    return Scaffold(
      appBar: AppBar(title: Text('Train Schedule')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('1 minute (VT) = 1 second (RT)'),
            Text('1 hour (VT) =  1 minute second (RT)'),
            SizedBox(height: 20),
            Text('Current Time: $currentTimeFormatted'),
            Text('Time Left to 5:00 PM: $timeLeftMinutes minutes'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: trains.length,
                itemBuilder: (context, index) {
                  final train = trains[index];
                  final timeLeftVT = train.startTimeVT - currentTimeVT;
                  final timeLeftMinutes =
                      timeLeftVT < 0 ? timeLeftVT + 24 * 60 : timeLeftVT;

                  return TrainCard(train, timeLeftMinutes);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainCard extends StatelessWidget {
  final Train train;
  final int timeLeftMinutes;

  TrainCard(this.train, this.timeLeftMinutes);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Train: ${train.name}'),
            SizedBox(height: 10),
            Text('Time Left: ${timeLeftMinutes} minutes'),
          ],
        ),
      ),
    );
  }
}
