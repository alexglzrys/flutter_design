import 'package:design_flutter_app/screens/composition_design_screen.dart';
import 'package:design_flutter_app/screens/scroll_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:design_flutter_app/screens/basic_design_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(const DesignApp());

class DesignApp extends StatelessWidget {
  const DesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle se utiliza para configurar el estilo de superposición de la interfaz de usuario del sistema para la aplicación, para que tenga un aspecto mas claro u oscuro.
    // Esto puede afectar a elementos como la barra de estado y la barra de navegación, según el sistema operativo y la configuración del dispositivo.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Diseños Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'composition_design',
      routes: {
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll_design': (_) => const ScrollDesignScreen(),
        'composition_design': (_) => const CompositionDesignScreen(),
      },
    );
  }
}
