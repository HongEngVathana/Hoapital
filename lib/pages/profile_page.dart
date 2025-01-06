import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/editProfile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Profile Section
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Stack(
              children: [
                // Profile Info
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            "lib/assets/images/joseph.jpeg",
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Chetra Pang",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "chetra.pang.1222@gmail.com | +855 060 533004",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // Edit Icon
              ],
            ),
          ),

          // Options Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOptionTile(
                  context,
                  icon: Icons.edit,
                  title: "Edit profile information",
                  onTap: () {},
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.notifications,
                  title: "Notifications",
                  trailing: const Text(
                    "ON",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.language,
                  title: "Language",
                  trailing: const Text(
                    "English",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.security,
                  title: "Security",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.brightness_6,
                  title: "Theme",
                  trailing: const Text(
                    "Light mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                _buildOptionTile(
                  context,
                  icon: Icons.help_outline,
                  title: "Help & Support",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.mail_outline,
                  title: "Contact us",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy policy",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to Build ListTile Options
  Widget _buildOptionTile(BuildContext context,
      {required IconData icon,
      required String title,
      Widget? trailing,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
