import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrlBase = 'api.themoviedb.org';
  final String _apiKey = '590b4c7a0091dd534740300cc474f31e';
  final String _language = 'en-US';
  final double _page = 1;

  MoviesProvider() {
    print('Movies Provider initialized');

    this.getPlayinNowMovies();
  }

  getPlayinNowMovies() async {
    var url = Uri.https(_baseUrlBase, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '$_page'});
    final response = await http.get(url);
    final nowPlayingResponse =
        NowPlayingResponse.fromRawJson(response.body);
    print(nowPlayingResponse.results[1].title);
  }
}