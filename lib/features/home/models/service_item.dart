import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
