import 'package:design_flutter_app/screens/scroll_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:design_flutter_app/screens/basic_design_screen.dart';

void main() => runApp(const DesignApp());

class DesignApp extends StatelessWidget {
  const DesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'scroll_design',
      routes: {
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll_design': (_) => const ScrollDesignScreen(),
      },
    );
  }
}
