import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  // To manage the selected tab: "Current" or "History"
  bool isCurrentTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Tab Section
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabButton(
                  label: "Current",
                  isActive: isCurrentTab,
                  onTap: () {
                    setState(() {
                      isCurrentTab = true;
                    });
                  },
                ),
                TabButton(
                  label: "History",
                  isActive: !isCurrentTab,
                  onTap: () {
                    setState(() {
                      isCurrentTab = false;
                    });
                  },
                ),
              ],
            ),
          ),
          // Appointment List Section
          Expanded(
            child: ListView(
              children: isCurrentTab
                  ? currentAppointments.map((appointment) {
                      return AppointmentCard(
                        date: appointment['date']!,
                        practice: appointment['practice']!,
                        doctor: appointment['doctor']!,
                        type: appointment['type']!,
                        time: appointment['time']!,
                        patient: appointment['patient']!,
                      );
                    }).toList()
                  : historyAppointments.map((appointment) {
                      return AppointmentCard(
                        date: appointment['date']!,
                        practice: appointment['practice']!,
                        doctor: appointment['doctor']!,
                        type: appointment['type']!,
                        time: appointment['time']!,
                        patient: appointment['patient']!,
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Tab Button Widget
class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.teal : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Appointment Card Widget
class AppointmentCard extends StatelessWidget {
  final String date;
  final String practice;
  final String doctor;
  final String type;
  final String time;
  final String patient;

  AppointmentCard({
    required this.date,
    required this.practice,
    required this.doctor,
    required this.type,
    required this.time,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        practice,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("• $doctor"),
                      Text("• $type"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 8),
                Text(time),
                Spacer(),
                Icon(Icons.person, color: Colors.grey),
                SizedBox(width: 8),
                Text(" $patient"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Mock Data for Current Appointments
final List<Map<String, String>> currentAppointments = [
  {
    "date": "5 Wed May",
    "practice": "General Checkup",
    "doctor": "Dr Joseph Pang",
    "type": "Standard consult",
    "time": "08.30am",
    "patient": "Chetra Pang",
  },
  {
    "date": "13 Thu Oct",
    "practice": "General Checkup",
    "doctor": "Dr Jennifer Nguyen",
    "type": "Standard consult",
    "time": "11.30am",
    "patient": "Chetra Pang",
  },
  {
    "date": "2 Mon Dec",
    "practice": "General Family Practice",
    "doctor": "Dr Strange",
    "type": "Childhood Immunisation",
    "time": "11.45am",
    "patient": "Chetra Pang",
  },
];

// Mock Data for History Appointments
final List<Map<String, String>> historyAppointments = [
  {
    "date": "15 Tue Nov",
    "practice": "City Health Clinic",
    "doctor": "Dr Alice Smith",
    "type": "General Checkup",
    "time": "10.00am",
    "patient": "Jamie Williams",
  },
  {
    "date": "12 Sat Nov",
    "practice": "General Family Practice",
    "doctor": "Dr John Doe",
    "type": "Dental Cleaning",
    "time": "2.30pm",
    "patient": "Chetra Pang",
  },
];
