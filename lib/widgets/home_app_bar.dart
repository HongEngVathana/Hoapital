import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: const Row(
        children: [
          // Menu Icon
          Icon(
            Icons.sort,
            size: 28,
            color: Colors.teal,
          ),
          SizedBox(width: 10),
          // Greeting Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Chetra Pang",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          // Notification Icon and Profile Picture
          Row(
            children: [
              Icon(
                Icons.notifications_none,
                size: 28,
                color: Colors.teal,
              ),
              SizedBox(width: 15),
              // Profile Picture
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'lib/assets/images/joseph.jpeg'), // Replace with your profile image path
              ),
            ],
          ),
        ],
      ),
    );
  }
}
