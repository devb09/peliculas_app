import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/helpers/debouncer.dart';
import 'package:peliculas_app/models/credits.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/search_movie_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrlBase = 'api.themoviedb.org';
  final String _apiKey = '590b4c7a0091dd534740300cc474f31e';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int popularPage = 0;

  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    getPlayinNowMovies();
    getPopularMovies();
  }

  final debouncer = Debouncer(duration: Duration(milliseconds: 500));

  final StreamController<List<Movie>> _sugestionsStreamControoler =
      new StreamController.broadcast();
  Stream<List<Movie>> get suggestionsStream =>
      _sugestionsStreamControoler.stream;

  Future<String> _getJsonData(String endpoint, {page = 1}) async {
    final url = Uri.https(_baseUrlBase, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getPlayinNowMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final movieResponse = NowPlayingResponse.fromRawJson(jsonData);
    onDisplayMovies = movieResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    popularPage++;
    final jsonData = await _getJsonData('/3/movie/popular', page: popularPage);
    final movieResponse = NowPlayingResponse.fromRawJson(jsonData);
    popularMovies = [...popularMovies, ...movieResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    print('pidiendo data al server');

    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrlBase, '/3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final response = await http.get(url);
    final searchResponse = SearchMovieResponse.fromRawJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery( String searchTem){
    
  }
}
