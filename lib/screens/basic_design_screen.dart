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
          _HeaderTile()
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
      padding: const EdgeInsets.all(16.0),
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
