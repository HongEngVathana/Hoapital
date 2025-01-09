import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/models/editProfile_model.dart';
import 'package:hospital/features/auth/views/home_screen.dart';
import 'package:hospital/services/editProfile_service.dart';

// Screen 1: Personal Information
class PersonalInfoScreen extends StatefulWidget {
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final PersonalInfoService _service = PersonalInfoService();
  PersonalInfo? _personalInfo;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final info = await _service.loadPersonalInfo();
    setState(() {
      _personalInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_personalInfo == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(color: AppColors.primary),
        ),
        backgroundColor: AppColors.text,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
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
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
                "Full name in English", _personalInfo!.fullNameEnglish),
            const SizedBox(height: 16),
            _buildTextField("Full name in Khmer", _personalInfo!.fullNameKhmer),
            const SizedBox(height: 16),
            _buildTextField("Email", _personalInfo!.email),
            const SizedBox(height: 16),
            _buildTextField("Phone number", _personalInfo!.phoneNumber),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      style: TextStyle(color: AppColors.text, fontSize: 16),
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
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: AppColors.text, fontSize: 16),
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

  Widget _buildTextField(String label, String value) {
    return TextField(
      controller: TextEditingController(text: value),
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
  String? selectedGender; // Track the selected gender

  final PersonalInfoService _service = PersonalInfoService();
  PersonalInfo? _personalInfo;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final info = await _service.loadPersonalInfo();
    setState(() {
      _personalInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_personalInfo == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: AppColors.primary),
        ),
        backgroundColor: AppColors.text,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Identification", _personalInfo!.id),
            const SizedBox(height: 16),
            _buildTextField("Driver License", _personalInfo!.driverID),
            const SizedBox(height: 16),
            _buildTextField("Date of birth", _personalInfo!.dob),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildGenderButton(context, "Male"),
                const SizedBox(width: 10),
                _buildGenderButton(context, "Female"),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField("Address", _personalInfo!.address),
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
                      style: TextStyle(color: AppColors.text, fontSize: 16),
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
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: AppColors.text, fontSize: 16),
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

  Widget _buildTextField(String label, String value) {
    return TextField(
      controller: TextEditingController(text: value),
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
        backgroundColor:
            selectedGender == gender ? AppColors.primary : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        gender,
        style: const TextStyle(
            color: AppColors.text, fontWeight: FontWeight.w900, fontSize: 16),
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
  final PersonalInfoService _service = PersonalInfoService();
  PersonalInfo? _personalInfo;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();

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

  Future<void> _loadData() async {
    final info = await _service.loadPersonalInfo();
    setState(() {
      _personalInfo = info;
      if (_personalInfo != null) {
        heightController.text = _personalInfo!.height.toString();
        weightController.text = _personalInfo!.weight.toString();
        _calculateBMI();
      }
    });
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
    if (_personalInfo == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: AppColors.primary),
        ),
        backgroundColor: AppColors.text,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
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
                      style: TextStyle(color: AppColors.text, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0), // Space between buttons
                // Submit Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
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
                      "Submit",
                      style: TextStyle(color: AppColors.text, fontSize: 16),
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
      {bool isReadOnly = false}) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
