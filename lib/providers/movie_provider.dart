import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MovieProvider extends ChangeNotifier{
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  String _language = 'es-MX';

  MovieProvider() {
    if (_apiKey.isEmpty) {
      throw StateError('Falta la variable TMDB_API_KEY en el archivo .env');
    }
  }

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  final Map<int, List<Cast>> moviesCast = {};

  MovieProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {'api_key':_apiKey,'language':_language,'page':'1'});
    final response=await http.get(url);
    final Map<String, dynamic> decodeData=json.decode(response.body);
    print(decodeData);
    final nowPlayingResponse=NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
  getPopularMovies() async{
    var url=Uri.https(_baseUrl, '3/movie/popular', {'api_key':_apiKey,'language':_language,'page':'1'});
    final response=await http.get(url);
    final Map<String,dynamic> decodeData=json.decode(response.body);
    print(decodeData);
    final popularResponse = PopularResponse.fromRawJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
  Future<List<Cast>> getMoviesCast(int movieId)async{
    if (moviesCast.containsKey(movieId))return moviesCast[movieId]!;
  
    var url = Uri.https(_baseUrl, '3/movie/$movieId/credits', {'api_key':_apiKey,'language':_language});

    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromJson(json.decode(response.body));

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}