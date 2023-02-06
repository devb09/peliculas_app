// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/movie.dart';

class NowPlayingResponse {
  NowPlayingResponse({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates? dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory NowPlayingResponse.fromRawJson(String str) =>
      NowPlayingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: Dates.fromJson(json["dates"] ?? {'date': ''}),
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"] ?? '2023-02-04'),
        minimum: DateTime.parse(json["minimum"] ?? '2023-02-04'),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
