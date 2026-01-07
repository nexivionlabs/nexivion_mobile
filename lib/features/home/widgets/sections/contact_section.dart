import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: const Text(
        'Contact Section',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
