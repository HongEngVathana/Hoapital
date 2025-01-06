import 'package:flutter/material.dart';

class Userinformationform extends StatefulWidget {
  const Userinformationform({super.key});

  @override
  State<Userinformationform> createState() => _UserinformationformState();
}

class _UserinformationformState extends State<Userinformationform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Pleas Check And Edit Your \n Information",
      )),
      body: Column(),
    );
  }
}
