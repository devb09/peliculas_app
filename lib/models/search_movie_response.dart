import 'dart:convert';
import 'package:peliculas_app/models/movie.dart';

class SearchMovieResponse {
    SearchMovieResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SearchMovieResponse.fromRawJson(String str) => SearchMovieResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchMovieResponse.fromJson(Map<String, dynamic> json) => SearchMovieResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}
