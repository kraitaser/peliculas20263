import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas20263/providers/movie_provider.dart';
import 'package:peliculas20263/widgets/card_swiper.dart';
import 'package:peliculas20263/widgets/card_slider.dart';

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
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardSwiper(movies: moviesProvider.onDisplayMovies),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
                    child: Text(
                      'pelis populares',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CardSlider(movies: moviesProvider.popularMovies),
                ],
              ),
            ),
    );
  }
}