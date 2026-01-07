import 'package:flutter/material.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'How We Work',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'A simple, transparent process from idea to launch',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              _ProcessStep(
                number: '01',
                title: 'Discover',
                description: 'Understanding goals, users, and constraints.',
              ),
              _ProcessArrow(),
              _ProcessStep(
                number: '02',
                title: 'Build',
                description: 'Designing and developing with quality and speed.',
              ),
              _ProcessArrow(),
              _ProcessStep(
                number: '03',
                title: 'Launch',
                description: 'Delivering, monitoring, and improving.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}

class _ProcessArrow extends StatelessWidget {
  const _ProcessArrow();

  @override
  Widget build(BuildContext context) {
    // Hidden on small screens via LayoutBuilder or simplified here
    // For simplicity in this StatelessWidget constraint, we use a simple icon
    // that wraps naturally. In a real responsive scenario, you might hide this
    // on small breakpoints. Here we make it subtle.
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Icon(
        Icons.arrow_right_alt_rounded,
        size: 32,
        color: Colors.grey.shade300,
      ),
    );
  }
}