import 'package:flutter/material.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/services_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ServicesSection(),
          ],
        ),
      ),
    );
  }
}
