import 'package:flutter/material.dart';

// Widget encargado de mostrar la barra de navegación inferior
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: 'Caledario'),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_sharp), label: 'Gráfica'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_sharp), label: 'Usuarios')
      ],
      // Personalización de estilo RGBO (opacity), ARGB (alpha), colores preestablecidos pink[opacidad]
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      selectedItemColor: Colors.pink[200],
      unselectedItemColor: const Color.fromARGB(255, 116, 117, 152),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
