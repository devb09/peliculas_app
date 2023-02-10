import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Color.fromARGB(255, 235, 189, 189),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'En cartelera'.toUpperCase(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromRGBO(236, 28, 28, 0.753)),
            ),
          ),
          Swiper(
            autoplay: false,
            itemCount: movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: ((_, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/details',
                    arguments: 'movie-instance'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
