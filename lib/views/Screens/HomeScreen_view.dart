import 'package:flutter/material.dart';

class HpomeScreen extends StatefulWidget {
  const HpomeScreen({super.key});

  @override
  State<HpomeScreen> createState() => _HpomeScreenState();
}

class _HpomeScreenState extends State<HpomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Home Screen")),
      ),
      body: Column(children: [
        Text("ooooops"),
      ]),
    );
  }
}
