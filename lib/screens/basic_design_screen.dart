import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Banner o Imagen principal
          Image(
            image: AssetImage('assets/images/banner.jpg'),
          ),
          // Titulos de Cabecera
          _HeaderTile(),
          // Botonera de acciones
          _ActionButtons(),
        ],
      ),
    );
  }
}

// Widget encargado de mostrar los titulos de cabecera
// Para diseños complejos, se recomienda dividirlos en widgets más pequeños que faciliten la comprensión y lectura del código.
// Los widgets pueden estr separados en archivos externos como clases independientes, o en el mimso archivo como clases privadas (para diseños medianos).
// Cuando se trabaja todo sobre el mismo archivo, se recomienda extraer los widgets como clases, y no decararlos dentro de una función que retorne un widget. Ya que estas últimas consumen más recursos, puesto que siempre se terminan ejecutando cuando un widget se redibuja.
class _HeaderTile extends StatelessWidget {
  const _HeaderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 25, right: 25, bottom: 10),
      child: const Row(
        children: [
          // Expanded se utiliza para expandir un widget hijo dentro de un Row, Column o Flex para ocupar el espacio disponible en el eje principal.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'El Rollo Parque Acuático',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                // SizedBox se utiliza para proporcionar un espacio explícito y fijo (altura | ancho) entre widgets en un layout.
                // es una manera sencilla y eficaz de ajustar el diseño de la aplicación y proporcionar espacio adicional según sea necesario.
                SizedBox(height: 2),
                Text(
                  'Morelos, México.',
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('1582')
        ],
      ),
    );
  }
}

// Widget encargado de mostrar la sección de botones de acción
class _ActionButtons extends StatelessWidget {
  const _ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _IconTextButton(
            title: 'Llamar',
            icon: Icons.call,
            function: () {
              print('llamar a atención a clientes');
            },
          ),
          _IconTextButton(
            title: 'Ruta',
            icon: Icons.near_me,
            function: () {
              print('Trazar ruta');
            },
          ),
          _IconTextButton(
            title: 'Compartir',
            icon: Icons.share,
            function: () {
              print('compartir');
            },
          ),
        ],
      ),
    );
  }
}

// Widget para mostar un botón personalizado que contenga un icono y un texto en sentido vertical
class _IconTextButton extends StatelessWidget {
  const _IconTextButton({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
  });
  // Este widget requiere el texto, icono y la función a ejecutar cuando se haga tap o click en el
  final String title;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    // InkWell proporciona un efecto de "splash" cuando se toca, similar al comportamiento de los botones estándar de Flutter.
    // Sirve principalmente para proporcionar retroalimentación táctil visual a los usuarios cuando interactúan con un área determinada de la UI
    // También puede manejar gestos como onTap, onDoubleTap, onLongPress, etc., para permitir acciones específicas cuando se toca el área.
    // Para el caso de este ejemplo, se requiere que todo el contenido de la columna reaccione al gesto tap y se ejecute una determianda acción
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      // Acciones a ejecutar cuando se hace tap
      onTap: () => function(),
      // Se recomienda envolver los widgets en Containers para sumarles, márgen, padding, color de fondo, etc.
      child: Container(
        width: 75,
        height: 75,
        padding: const EdgeInsets.all(2.0),
        // Mostrar los elementos visuales de este widget en sentido vertical
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 28,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.blue, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
