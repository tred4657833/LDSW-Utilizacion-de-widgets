import 'package:flutter/material.dart';

import 'catalog_screen.dart';

// Actividad 3.5: Home screen (pantalla de inicio) con layout.
// Muestra: imagen de fondo (Image), icono (Icon), nombre de la app
// y mensaje de bienvenida (Text).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String appName = 'CineApp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo a pantalla completa.
          Image.asset(
            'assets/images/fondo.png',
            fit: BoxFit.cover,
          ),

          // Capa oscura para mejorar la legibilidad del texto.
          Container(color: const Color(0x59000000)),

          // Contenido centrado.
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 3),

                  // Icono.
                  const Icon(Icons.movie_filter, size: 96, color: Colors.white),
                  const SizedBox(height: 20),

                  // Nombre de la aplicación.
                  const Text(
                    appName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Mensaje de bienvenida.
                  const Text(
                    'Hello World',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '¡Bienvenido! Descubre tus películas favoritas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  const Spacer(flex: 4),

                  // Acceso al catálogo (actividad 3.4).
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CatalogScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Ver catálogo'),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
