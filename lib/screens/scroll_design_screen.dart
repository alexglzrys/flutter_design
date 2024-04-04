import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // El diseño de esta pantalla requiere colocar elementos uno encima de otros en posiciones específicas
      body: Stack(
        children: [
          // Imagen de fondo
          _Background(),
          // Contenido principal
          _MainContent()
        ],
      ),
    );
  }
}

// Widget encargado de mostrar la imagen de fondo
class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // Ocupar el 100% del alto y ancho de la pantalla
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        // La iumagen tiene transparencia en la parte inferior, al declarar un color de fondo, este termina por rellenar la parte transparente
        color: const Color(0xff30bad6),
        child: const Image(
          image: AssetImage('assets/images/scroll-1.png'),
          fit: BoxFit.cover,
        ));
  }
}

// Widget encargado de mostrar el contenido principal sobre la imagen de fondo
class _MainContent extends StatelessWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Los contenidos de este widget se deben mostrar dentro un área segura
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '11°',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Miércoles',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            // Se requiere una separación que ocupe todo es espacio disponible dentro de la columna
            Expanded(child: SizedBox()),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 80,
            )
          ],
        ),
      ),
    );
  }
}
