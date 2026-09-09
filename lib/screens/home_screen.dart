import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas20263/providers/movie_provider.dart';
import 'package:peliculas20263/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('pelis en cines'),
      ),
      body: moviesProvider.onDisplayMovies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CardSwiper(movies: moviesProvider.onDisplayMovies),
              ],
            ),
    );
  }
}