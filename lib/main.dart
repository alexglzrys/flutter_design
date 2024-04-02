import 'package:flutter/material.dart';

void main() => runApp(const DesignApp());

class DesignApp extends StatelessWidget {
  const DesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diseños Flutter',
      debugShowCheckedModeBanner: false,
      home: Center(child: Text('Hola Mundo')),
    );
  }
}
