import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/models/prescription_model.dart';
import 'package:hospital/services/prescription_service.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  late Future<List<Prescription>> prescriptions;

  @override
  void initState() {
    super.initState();
    prescriptions = PrescriptionService().fetchPrescriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription"),
        backgroundColor: AppColors.primary,
      ),
      body: FutureBuilder<List<Prescription>>(
        future: prescriptions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No prescriptions found."));
          }

          final prescriptionList = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: prescriptionList.length,
            itemBuilder: (context, index) {
              final prescription = prescriptionList[index];
              return _buildPrescriptionCard(prescription);
            },
          );
        },
      ),
    );
  }

  Widget _buildPrescriptionCard(Prescription prescription) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hospital Name: ${prescription.hospitalName}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text("Date: ${prescription.date}"),
          const SizedBox(height: 5),
          Text("Doctor: ${prescription.doctor}"),
          const SizedBox(height: 10),
          ...prescription.medicines.map((medicine) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Medicine Name: ${medicine.name}"),
                Text(
                  "Dosage: ${medicine.dosage.frequency.join(", ")} (${medicine.dosage.instructions})",
                ),
                Text("Duration: ${medicine.duration}"),
                Text("Total Quantity: ${medicine.totalQuantity}"),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle Delete
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                child: const Text("Delete"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle View
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text("View"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
