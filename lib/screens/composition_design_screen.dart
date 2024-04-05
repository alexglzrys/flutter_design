import 'package:design_flutter_app/widgets/background.dart';
import 'package:design_flutter_app/widgets/card_table.dart';
import 'package:design_flutter_app/widgets/custom_navigation_bar.dart';
import 'package:design_flutter_app/widgets/page_title.dart';
import 'package:flutter/material.dart';

class CompositionDesignScreen extends StatelessWidget {
  const CompositionDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Fixbug: Caundo se aplica un efecto blur, y existe un bottomNavigationBar,
      // se muestra una linea en la parte inferior que se corresponde con el color de fondo de la pantalla.
      backgroundColor: Color(0xff202333),
      body: Stack(children: [
        // Background
        Background(),
        // Body
        _HomeBody()
      ]),
      bottomNavigationBar: CustomNavigationBar(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PageTitle
          PageTitle(),
          SizedBox(height: 10),
          // Card Table
          CardTable(),
        ],
      ),
    ));
  }
}
