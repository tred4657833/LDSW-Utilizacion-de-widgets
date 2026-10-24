import 'package:flutter/material.dart';

void main() => runApp(const CineApp());

class CineApp extends StatelessWidget {
  const CineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1F4E79),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CineApp')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedBanner(),
            SizedBox(height: 20),
            SectionTitle('Géneros'),
            SizedBox(height: 8),
            GenreChips(),
            SizedBox(height: 20),
            SectionTitle('Estrenos'),
            SizedBox(height: 8),
            MovieRow(),
          ],
        ),
      ),
    );
  }
}

// Stack + Container + Text + Row: banner de película destacada.
class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF1F4E79), Color(0xFF0B1F33)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(Icons.movie, size: 72, color: Colors.white24),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 16),
                SizedBox(width: 4),
                Text('4.5', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Película destacada',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '2026 · Acción · 2 h 10 min',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

// Row + Container + Text: chips de géneros.
class GenreChips extends StatelessWidget {
  const GenreChips({super.key});

  static const List<String> genres = ['Acción', 'Drama', 'Comedia', 'Terror'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final genre in genres)
          Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFD6EAF8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(genre),
          ),
      ],
    );
  }
}

// Row + Expanded: fila con tres tarjetas de películas.
class MovieRow extends StatelessWidget {
  const MovieRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: MovieCard(title: 'Título 1', year: '2026')),
        SizedBox(width: 12),
        Expanded(child: MovieCard(title: 'Título 2', year: '2026')),
        SizedBox(width: 12),
        Expanded(child: MovieCard(title: 'Título 3', year: '2025')),
      ],
    );
  }
}

// Column + Container + Text: tarjeta de una película.
class MovieCard extends StatelessWidget {
  final String title;
  final String year;

  const MovieCard({super.key, required this.title, required this.year});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E8EB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Icon(Icons.image, size: 40, color: Colors.black38),
          ),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(year, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
