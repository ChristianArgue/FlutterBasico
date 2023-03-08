// To parse this JSON data, do
//
//     final tvResponse = tvResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class TvResponse {
    TvResponse({
       required this.page,
       required this.results,
       required this.totalPages,
       required this.totalResults,
    });

    int page;
    List<Serie> results;
    int totalPages;
    int totalResults;

    factory TvResponse.fromJson(String str) => TvResponse.fromMap(json.decode(str));

    factory TvResponse.fromMap(Map<String, dynamic> json) => TvResponse(
        page: json["page"],
        results: List<Serie>.from(json["results"].map((x) => Serie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
