import 'package:flutter/material.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:hospital/pages/todolist_page.dart';

// Screen 1: Personal Information
class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController fullNameEnglishController =
      TextEditingController(text: "John Doe");
  final TextEditingController fullNameKhmerController =
      TextEditingController(text: "ជន ដូ");
  final TextEditingController emailController =
      TextEditingController(text: "john.doe@example.com");
  final TextEditingController phoneNumberController =
      TextEditingController(text: "0123456789");

  PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personal Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField("Full name in English", fullNameEnglishController),
            const SizedBox(height: 16),
            _buildTextField("Full name in Khmer", fullNameKhmerController),
            const SizedBox(height: 16),
            _buildTextField("Email", emailController),
            const SizedBox(height: 16),
            _buildTextField("Phone number", phoneNumberController),

            // Spacer to push the buttons to the bottom
            const Spacer(),

            // Buttons aligned as per the image
            Row(
              children: [
                // Back Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0), // Space between buttons
                // Next Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IdentificationScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            // Add bottom padding to ensure proper positioning
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

// Screen 2: Identification
class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final TextEditingController idController =
      TextEditingController(text: "123456789");
  final TextEditingController dobController =
      TextEditingController(text: "1990-01-01");
  final TextEditingController addressController =
      TextEditingController(text: "123 Main Street, City");

  String? selectedGender; // Track the selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Identification", idController),
            const SizedBox(height: 16),
            _buildTextField("Driver License", idController),
            const SizedBox(height: 16),
            _buildTextField("Date of birth", dobController, isDate: true),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildGenderButton(context, "Male"),
                const SizedBox(width: 10),
                _buildGenderButton(context, "Female"),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField("Address", addressController),
            const Spacer(),
            Row(
              children: [
                // Back Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0), // Space between buttons
                // Next Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MeasurementsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isDate = false}) {
    return TextField(
      controller: controller,
      keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildGenderButton(BuildContext context, String gender) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedGender = gender; // Update the selected gender
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedGender == gender ? Colors.teal : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        gender,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
      ),
    );
  }
}

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  _MeasurementsScreenState createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  final TextEditingController heightController =
      TextEditingController(text: "170");
  final TextEditingController weightController =
      TextEditingController(text: "70");
  final TextEditingController bmiController =
      TextEditingController(text: "24.2");

  @override
  void initState() {
    super.initState();

    // Add listeners to update BMI when height or weight changes
    heightController.addListener(_calculateBMI);
    weightController.addListener(_calculateBMI);
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    bmiController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    final heightText = heightController.text;
    final weightText = weightController.text;

    if (heightText.isNotEmpty && weightText.isNotEmpty) {
      final height = double.tryParse(heightText);
      final weight = double.tryParse(weightText);

      if (height != null && weight != null && height > 0) {
        // Calculate BMI (height in meters)
        final bmi = weight / ((height / 100) * (height / 100));
        bmiController.text = bmi.toStringAsFixed(2);
      } else {
        bmiController.text = "Invalid input";
      }
    } else {
      bmiController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Height (cm)", heightController),
            const SizedBox(height: 16),
            _buildTextField("Weight (kg)", weightController),
            const SizedBox(height: 16),
            _buildTextField("BMI", bmiController, isReadOnly: true),
            const Spacer(),
            Row(
              children: [
                // Back Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0), // Space between buttons
                // Next Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TodolistPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isReadOnly = false, bool isDate = false}) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
