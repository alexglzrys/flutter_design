import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // SingleChildScrollView es un widget que proporciona desplazamiento en una dirección, ya sea vertical u horizontal
      // Este widget es útil cuando el contenido dentro de él puede ser más grande que el tamaño disponible del área visible en la pantalla, lo que podría hacer que parte del contenido sea inaccesible para el usuario sin la capacidad de desplazamiento.
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner o Imagen principal
            Image(
              image: AssetImage('assets/images/banner.jpg'),
            ),
            // Titulos de Cabecera
            _HeaderTile(),
            // Botonera de acciones
            _ActionButtons(),
            // Sección de descripción
            _MainContent()
          ],
        ),
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
      child: Row(
        children: [
          // Expanded se utiliza para expandir un widget hijo dentro de un Row, Column o Flex para ocupar el espacio disponible en el eje principal.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'El Rollo Parque Acuático',
                  // Usar tipografía de Google Fonts
                  // Si la nueva versión de un paquete o plugin da problemas, lo recomendable es bajar la versión en el archivo pubspec.yaml y retirar el acento circunflejo adjunto a la versión... google_fonts: 6.0.1
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                ),
                // SizedBox se utiliza para proporcionar un espacio explícito y fijo (altura | ancho) entre widgets en un layout.
                // es una manera sencilla y eficaz de ajustar el diseño de la aplicación y proporcionar espacio adicional según sea necesario.
                const SizedBox(height: 2),
                Text(
                  'Morelos, México.',
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black54)),
                )
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text(
            '1582',
            style: GoogleFonts.ubuntu(),
          )
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
              color: Colors.amber,
              size: 28,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.barlow(
                  textStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({super.key});

  // Simulación de texto recuperado desde un API
  final String contenidoAPI =
      "Prepárate para poner tu ritmo cardiaco al cien, al caer por 25 metros en sólo 5 segundos, mientras te deslizas de un extremo a otro por el tobogán más grande en América, toma la mano de tu amigo fuertemente y ¡deja que adrenalina se apodere de ti!<br>Si quieres surfear o disfrutar de la suaves olas como en el mar sin necesidad de salir del parque acuático más emocionante de Latinoamérica, cuentas con dos emocionantes albercas de olas y cuando quieras volver a la adrenalina de los toboganes, estás a unos cuantos pasos.<br>No sabrás qué te asusta y divierte más, si las curvas inesperadas o perder tu sentido de orientación, mientras te deslizas en un tobogán cerrado que emocionará a toda la familia con seguridad y la dosis perfecta de adrenalina.<br>Único tobogán temático en México, completamente a oscuras en un misterioso recorrido. ¡Más largo que cualquier túnel al cual hayas entrado!<br>Decídete a lanzarte desde 23 metros de altura con este tobogán extremo. Para que no te aburras, agregamos 5 segundos de caída libre al recorrido. Puedes agradecernos cuando llegues al final… si te atreves.";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // El método expand en Dart se utiliza para "expandir" una lista en otra lista
          // Transforma cada elemento de una lista en una nueva lista, y luego concatenar todas esas nuevas listas en una sola lista. Es útil cuando necesitas aplicar una operación a cada elemento de una lista y luego combinar los resultados en una sola lista.
          // Por cada párrafo, se genera una lista plana de elementos (Text, SizedBox), al finalizar concatenamos esas listas planas en una sola lista, que forma parte del resultado del children [Text(), SizedBox(), Text(), SizedBox(), Text(), SizedBox()....]
          children: brToList(contenidoAPI)
              .expand((paragraph) => [
                    Text(
                      paragraph,
                      style: GoogleFonts.arimo(
                          textStyle: const TextStyle(
                              color: Colors.black87, height: 1.4)),
                    ),
                    const SizedBox(height: 12),
                  ])
              .toList(),
        ));
  }
}

// Método utilitario para convertir un texto que contiene elementos HTML <br> a una lista de textos en Dart
List<String> brToList(String text) {
  final List<String> list = text.split('<br>');
  return list;
}
