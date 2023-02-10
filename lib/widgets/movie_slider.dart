import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/providers/movies_provider.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider(
      {super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromRGBO(236, 28, 28, 0.753)),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = widget.movies[index];
                return _MoviePoster(movieData: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movieData;
  const _MoviePoster({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.amber,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movieData.fullPosterImg),
                width: 130,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieData.originalTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
