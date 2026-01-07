import 'package:flutter/material.dart';
import '../../../../core/shared/layout/app_scaffold.dart';


class AppScaffold extends StatelessWidget {
  final Widget child;
  final VoidCallback onHome;
  final VoidCallback onServices;
  final VoidCallback onProcess;
  final VoidCallback onContact;

  const AppScaffold({
    super.key,
    required this.child,
    required this.onHome,
    required this.onServices,
    required this.onProcess,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavbar(
            onHome: onHome,
            onServices: onServices,
            onProcess: onProcess,
            onContact: onContact,
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
