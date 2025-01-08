import 'package:flutter/material.dart';
import 'package:hospital/widgets/search_bar.dart';
import 'package:remixicon/remixicon.dart';

class DiagnosticsServicesScreen extends StatelessWidget {
  const DiagnosticsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        title: const Text(
          "Diagnostics",
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.notifications_active,
              color: Colors.teal,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const MySearchBar(),
              const SizedBox(height: 15),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Diagnostics',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildServiceItem(Remix.stethoscope_line, "Consultation"),
                  _buildServiceItem(Remix.lungs_fill, "Lungs"),
                  _buildServiceItem(Remix.syringe_line, "Syringe"),
                  _buildServiceItem(Remix.virus_fill, "Virus-fill"),
                  _buildServiceItem(Remix.capsule_fill, "Drug"),
                  _buildServiceItem(Remix.psychotherapy_fill, "Psychotherapy"),
                  _buildServiceItem(Remix.test_tube_fill, "Test tube"),
                  _buildServiceItem(Remix.heart_pulse_fill, "Heart")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Services',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
              Image.asset("lib/assets/images/loading.gif"),
              // SizedBox(height: ,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 35, // Increase the radius to make the background bigger
          child: Icon(
            icon,
            color: Colors.teal,
            size: 45, // Keep the icon size the same
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
