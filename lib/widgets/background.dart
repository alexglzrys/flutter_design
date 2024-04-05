import 'package:flutter/material.dart';

// Widget que representa el color de fondo gradiente con aditamento decorativo flotante
class Background extends StatelessWidget {
  const Background({super.key});
  // Propiedad de clase que define la decoración del fondo de la pantalla
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
    colors: [
      Color(0xff2e305f),
      Color(0xff202333),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.8],
  ));

  @override
  Widget build(BuildContext context) {
    // El aditamento decorativo debe estar por encima del color de fonod y en una ubicación estrategica
    return Stack(
      children: [
        // Fondo Gradiente
        Container(
          decoration: boxDecoration,
        ),
        // Aditamento decorativo posicionado de forma absoluta sobre la pantalla
        const Positioned(
          top: -100,
          left: -40,
          child: _PinkBox(),
        )
      ],
    );
  }
}

// Widget que representa el elemento decorativo o artístico
class _PinkBox extends StatelessWidget {
  const _PinkBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Transform.rotate se utiliza para rotar un widget alrededor de un punto de origen específico.
    // Permite aplicar una rotación en radianes a un widget o a un conjunto de widgets dentro de un árbol de widgets.
    return Transform.rotate(
      angle: -0.6,
      // Cuadro con bordes redondeados
      child: Container(
        width: 350,
        height: 350,
        // Color gradiente lineal
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ],
          ),
        ),
      ),
    );
  }
}
