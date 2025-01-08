import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/appointment_model.dart';
import 'package:hospital/features/auth/views/Diagnostics_screen.dart';
import 'package:hospital/features/auth/views/appointment_screen.dart';
import 'package:hospital/features/auth/views/editProfile_screen.dart';
import 'package:hospital/features/auth/views/insurance_screen.dart';
import 'package:hospital/pages/todolist_page.dart';
import 'package:hospital/services/appointment_service.dart';
import 'package:hospital/widgets/home_app_bar.dart';
import 'package:hospital/widgets/image_slider.dart';
import 'package:hospital/widgets/search_bar.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  late Future<List<Appointment>> appointments;

  @override
  void initState() {
    super.initState();
    appointments = AppointmentService().fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Spacing Reduced
                const SizedBox(height: 15),
                const CustomAppBar(),
                const SizedBox(height: 15),
                const MySearchBar(),
                const SizedBox(height: 15),
                ImageSlider(
                  currentSlide: currentSlider,
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Task Progress Card
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 77, 26, 138),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Your today's tasks\nalmost done!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => TodolistPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "View Task",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 77, 26, 138),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        Stack(
                          alignment: Alignment.center,
                          children: const [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: 0.85,
                                strokeWidth: 10,
                                color: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 203, 33, 233),
                              ),
                            ),
                            Text(
                              "85%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Icon Grid Section
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  padding: const EdgeInsets.all(12), // Reduced padding
                  decoration: BoxDecoration(
                    color: Colors.teal[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 5, // Reduced spacing between rows
                    crossAxisSpacing: 5, // Reduced spacing between columns
                    children: [
                      _buildIconWithLabel(Remix.user_fill, "Account", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalInfoScreen()));
                      }),
                      _buildIconWithLabel(Remix.stethoscope_fill, "Diagnostics",
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DiagnosticsServicesScreen()));
                      }),
                      _buildIconWithLabel(Remix.id_card_line, "Insurance", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InsuranceScreen()));
                      }),
                      _buildIconWithLabel(
                          Remix.calendar_check_line, "Appointment", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentsScreen()));
                      }),
                      _buildIconWithLabel(
                          Icons.receipt_long_outlined, "History", () {}),
                      _buildIconWithLabel(
                          Icons.payments_outlined, "Bill Payments", () {}),
                      _buildIconWithLabel(
                          Remix.dossier_line, "Prescriptions", () {}),
                      _buildIconWithLabel(
                          Icons.receipt_outlined, "Receipt", () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Categories Section
                if (selectedIndex == 0)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                _category(),
                const SizedBox(height: 20),
                if (selectedIndex == 0) const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Upcoming Appointments",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.sort,
                      size: 25,
                      color: Colors.teal,
                    ),
                  ],
                ),
                FutureBuilder<List<Appointment>>(
                  future: appointments,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No appointments available.'),
                      );
                    }

                    // Sort appointments by date in ascending order
                    List<Appointment> sortedAppointments = snapshot.data!;
                    sortedAppointments.sort((a, b) => DateTime.parse(a.date)
                        .compareTo(DateTime.parse(b.date)));

                    return Column(
                      children: sortedAppointments
                          .map((appointment) =>
                              AppointmentCard(appointment: appointment))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Error: type _Map<String, dynamic> is not a subtype of type  'list<dynamic>

  Widget _category() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard1(
                "Chemist & Drugist",
                "350 + Stores",
                color: Colors.teal.shade300,
                lightColor: Colors.teal.shade100,
              ),
              _categoryCard1(
                "Covid - 19 Specialist",
                "899 Doctors",
                color: Colors.blue.shade400,
                lightColor: Colors.blue.shade200,
              ),
              _categoryCard1(
                "Cardiologists Specialist",
                "500 + Doctors",
                color: Colors.orange.shade300,
                lightColor: Colors.orange.shade100,
              ),
              _categoryCard1(
                "Dermatologist",
                "300 + Doctors",
                color: Colors.teal.shade300,
                lightColor: Colors.teal.shade100,
              ),
              _categoryCard1(
                "General Surgeon",
                "500 + Doctors",
                color: Colors.blue.shade400,
                lightColor: Colors.blue.shade200,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard1(String title, String subtitle,
      {required Color color, required Color lightColor}) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: lightColor,
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28, // Adjusted icon size
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 34, // Reduced icon size
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 4), // Reduced space between icon and label
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 11, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          // Date Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointment.date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appointment.day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Appointment Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointment.time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  appointment.doctor,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  appointment.appointmentType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
