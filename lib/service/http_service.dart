import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_rest_api_flutter/models/movie.dart';

class HttpService {
  final String apiKey = '11cc63718ff0d986291737254b4c8861';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      // final jsonResponse = json.decode(result.body);
      // final moviesMap = jsonResponse['result'];
      // List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
