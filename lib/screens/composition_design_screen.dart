import 'package:design_flutter_app/widgets/background.dart';
import 'package:design_flutter_app/widgets/page_title.dart';
import 'package:flutter/material.dart';

class CompositionDesignScreen extends StatelessWidget {
  const CompositionDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        // Background
        Background(),
        // Body
        _HomeBody()
      ]),
    );
  }
}

// widget que representa el contenido principal de la pantalla
class _HomeBody extends StatelessWidget {
  const _HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Se requiere un área segura donde el usuario pueda hacer scroll
    return const SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // PageTitle
          PageTitle(),
        ],
      ),
    ));
  }
}
