import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';

class PaymentbillScreen extends StatefulWidget {
  const PaymentbillScreen({super.key});

  @override
  State<PaymentbillScreen> createState() => _PaymentbillScreenState();
}

class _PaymentbillScreenState extends State<PaymentbillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill Payment"),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Search Bar Placeholder
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          // First Bill Container
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Name: Vathana",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Date: 11/12/2024",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("ID card: 864436", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Type of disease: Headache",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Check Fee: \$300", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Warranty: No", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Drug prices: \$400",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text(
                  "Total: \$700",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // View and Pay Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle View action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Pay action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "Pay",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Second Bill Container (same structure as the first one)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Name: Vathana",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Date: 11/12/2024",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("ID card: 864436", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Type of disease: Headache",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Check Fee: \$300", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Warranty: No", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text("Drug prices: \$400",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Text(
                  "Total: \$700",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // View and Pay Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle View action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
