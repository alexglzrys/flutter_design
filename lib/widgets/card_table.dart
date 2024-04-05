import 'dart:ui';
import 'package:flutter/material.dart';

// Widget encargado de mostrar una tabla con tarjetas de acción
class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Table se utiliza para organizar los widgets hijos en forma de filas y columnas, similar a una tabla HTML
    return Table(
      children: [
        // TableRow define una fila dentro de la tabla. Cada TableRow contiene una lista de widgets hijos que representan las celdas de la fila.
        const TableRow(children: [
          _Card(
            icon: Icons.grid_view_rounded,
            title: 'General',
            color: Colors.blue,
            route: 'basic_design',
          ),
          _Card(
            icon: Icons.local_taxi,
            title: 'Transporte',
            color: Colors.purple,
            route: 'scroll_design',
          ),
        ]),
        // Segunda Fila
        TableRow(children: [
          _Card(
            icon: Icons.shopping_bag,
            title: 'Compras',
            color: Colors.pink[300]!,
          ),
          const _Card(
            icon: Icons.local_taxi,
            title: 'Pagos',
            color: Colors.amber,
          ),
        ]),
        // Tercera fila
        const TableRow(children: [
          _Card(
            icon: Icons.movie_creation,
            title: 'Entretenimiento',
            color: Color.fromARGB(255, 0, 153, 255),
          ),
          _Card(
            icon: Icons.blender,
            title: 'Comida',
            color: Colors.green,
          ),
        ])
      ],
    );
  }
}

// Widget encargado de mostrar una tarjeta con acción de tap
class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.route,
  });
  // Este widget es reutilizable, por ello recibe parámetros dinámicos
  final IconData icon;
  final String title;
  final Color color;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20)),
      // Material es un componente fundamental utilizado para implementar las especificaciones de Material Design,
      // es una lámina digital sobre la que se colocan otros widgets y proporciona efectos de elevación, animaciones y sombras para crear una interfaz de usuario visualmente atractiva y coherente.
      child: Material(
        color: Colors.transparent,
        // El InkWell está dentro del Material, lo que permite que el efecto de "ripple" sea visible incluso con el color de fondo definido. Esto te permite mantener el color de fondo deseado en el Container mientras se muestra el efecto de "ripple" al presionar sobre él.
        child: InkWell(
          onTap: () {
            // Navegar a la ruta indicada si se establece como párametro al usar este widget
            if (route != null) {
              Navigator.pushNamed(context, route!);
            }
          },
          // Si se mantiene presionado por mucho tiempo, el border radius del ripple se corresponde con el aplicado al contenedor padre, no se desborda
          borderRadius: BorderRadius.circular(20),
          // En este punto existirá un blur de fondo y una columna encima de este que representas el icono y el texto
          child: Stack(alignment: Alignment.center, children: [
            const _BlurContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar se utiliza para representar por lo general una imagen o un ícono en una forma circular. Sin embargo acepta cualquier widget como hijo
                // Es especialmente útil para mostrar avatares de usuario, fotos de perfil, íconos de contactos, etc
                CircleAvatar(
                  //backgroundColor: color,
                  backgroundColor: Colors.transparent,
                  // Especifica el tamaño del circulo
                  radius: 35,
                  // Necesitamos que el color del circulo sea un gradiente, por defecto CircleAvatar solo acepta colores sólidos, en este sentido pasamos un Container para su respectuva personalización
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(5),
                    // el contenedor debe ser circular con colores gradientes en direcciones diagonales
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, color],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0, 0.6])),
                    // El contenido del Container será un icono
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  title,
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// Widget que hace referencia al elemento de blur
class _BlurContainer extends StatelessWidget {
  const _BlurContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Cuando se aplica blur a un elemento, este se propaga a tal grado que aplica el efecto a todos los elementos de la pantalla. por eso existe un corte con ClipRRect
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // Efecto blur
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(),
        ),
      ),
    );
  }
}
