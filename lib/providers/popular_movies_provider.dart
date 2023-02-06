import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class PopularMoviesProvider extends ChangeNotifier {
  final String _baseUrlBase = 'api.themoviedb.org';
  final String _apiKey = '590b4c7a0091dd534740300cc474f31e';
  final String _language = 'en-US';
  final double _page = 1;

  List<Movie> onDisplayMovies = [];

  PopularMoviesProvider() {
    print('Popular initialized');
    getPopularMovies();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrlBase, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '$_page'});
    final response = await http.get(url);

    print('response popular');
    print(response);
    print(response.body);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}