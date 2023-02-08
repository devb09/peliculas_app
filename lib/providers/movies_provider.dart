import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrlBase = 'api.themoviedb.org';
  final String _apiKey = '590b4c7a0091dd534740300cc474f31e';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int popularPage = 0;

  MoviesProvider() {
    getPlayinNowMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, {page = 1}) async {
    var url = Uri.https(_baseUrlBase, endpoint,
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
}
