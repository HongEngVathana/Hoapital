// // lib/views/home_view.dart
// import 'package:flutter/material.dart';
// import 'package:your_app/widgets/custom_button.dart'; // Reusing a custom widget

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Welcome to the Home Page!'),
//         CustomButton(
//           label: 'Go to Profile',
//           onPressed: () {
//             // Navigate to the ProfilePage
//             Navigator.pushNamed(context, '/homepage');
//           },
//         ),
//       ],
//     );
//   }
// }
//This routes form homepage

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
