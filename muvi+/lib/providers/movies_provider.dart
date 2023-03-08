
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/popular_response.dart';
import 'package:peliculas/models/search_response.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey   = '0c13ffcc31c07cfac85d731df1d26fb0';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];
  Map<int, List<Cast>> movieCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [int page = 1]) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '$page'
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
   // print(nowPlayingResponse.results[1].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
   // print(nowPlayingResponse.results[1].title);
    popularMovies = [ ...popularMovies, ...popularResponse.results ];
    //print(popularMovies[0]);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;
    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key' : _apiKey,
      'language': _language,
      'query'   : query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}