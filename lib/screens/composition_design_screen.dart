import 'package:design_flutter_app/widgets/background.dart';
import 'package:flutter/material.dart';

class CompositionDesignScreen extends StatelessWidget {
  const CompositionDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        // Background
        Background(),
      ]),
    );
  }
}
