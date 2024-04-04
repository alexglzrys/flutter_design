import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Agregar color gradiente al Container
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          // Listado de colores
          colors: [
            Color(0xff5ee8c5),
            Color(0xff30bad6),
          ],
          // Posicion (orientación) inicial y final del degradado
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Puntos de parada para cada color declarado en el listado
          stops: [0.5, 0.5],
        )),
        // PageView permite al usuario desplazarse horizontalmente o verticalmente entre varios widgets hijos.
        // Es útil cuando deseas mostrar una colección de widgets de forma secuencial, donde cada widget representa una página o vista diferente.
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: const [
            _PrimaryView(),
            _SecondaryView(),
          ],
        ),
      ),
    );
  }
}

// Widget referente a la vista principal (No. 1)
class _PrimaryView extends StatelessWidget {
  const _PrimaryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // El diseño de esta pantalla requiere colocar elementos uno encima de otros en posiciones específicas
    return const Stack(
      children: [
        // Imagen de fondo
        _Background(),
        // Contenido principal
        _MainContent()
      ],
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

// Widget referente a la vista secundaria (No. 2)
class _SecondaryView extends StatelessWidget {
  const _SecondaryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xff30bad6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/user.png'),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido a Flutter Page View, la única App que te ayuda a encontrar soluciones',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {},
              // Decoración del botón
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
