import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

export '../models/models.dart';
import '../models/models.dart';

class CardSlider extends StatelessWidget {
  final List<Movie> movies;
  const CardSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Swiper(
        itemCount: movies.length,
        autoplay: true,
        autoplayDelay: 700000,
        duration: 1000,
        viewportFraction: 0.62,
        loop: true,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.32,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      key: ValueKey(movie.id),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white.withOpacity(0.1),
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}