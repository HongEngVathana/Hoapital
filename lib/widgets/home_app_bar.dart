import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          // Menu Icon
          Icon(
            Icons.sort,
            size: AppSizes.iconSize(context),
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
                  fontSize: AppFonts.getInputText(context),
                  color: Colors.grey,
                ),
              ),
              Text(
                "Chetra Pang",
                style: TextStyle(
                  fontSize: AppFonts.getInputText(context),
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
                size: AppSizes.iconSize(context),
                color: Colors.teal,
              ),
              SizedBox(width: 15),
              // Profile Picture
              CircleAvatar(
                radius: AppSizes.borderRadius(context),
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
