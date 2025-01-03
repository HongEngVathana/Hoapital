// import 'package:flutter/material.dart';
// import 'features/auth/views/login_screen.dart';
// import 'features/dashboard/views/home_screen.dart'; 
// import 'features/profile/views/profile_screen.dart'; 
// import 'features/settings/views/settings_screen.dart'; 

// class AppRoutes {
 
//   static const String login = '/login';
//   static const String home = '/home';
//   static const String profile = '/profile';
//   static const String settings = '/settings';


//   static Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case login:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case home:
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case profile:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());
//       case settings:
//         return MaterialPageRoute(builder: (_) => SettingsScreen());
//       default:
//         return null;
//     }
//   }
// }

// this page is Use for Routes page  

//step 2 
// import 'package:flutter/material.dart';
// import 'app_routes.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       initialRoute: AppRoutes.login, // Start at the login page
//       onGenerateRoute: AppRoutes.generateRoute, // Use AppRoutes for routing
//     );
//   }
// }

//you can use this    Navigator.pushNamed(context, AppRoutes.home);


// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(
//                 context, '/profile'); // Navigate to Profile page
//           },
//           child: Text('Go to Profile'),
//         ),
//       ),
//     );
//   }
// }


//to

// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(
//                 context, '/settings'); // Navigate to Settings page
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }
