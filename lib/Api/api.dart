import 'package:tmdb_app/constants.dart';
import 'package:tmdb_app/Model/movies_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.Api_key}';

  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.Api_key}';

  static const upComigUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.Api_key}';

  Future<List<Results>> getTrending() async{
    final response = await http.get(Uri.parse(trendingUrl));

    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie)=> Results.fromJson(movie)).toList();
    }
    else{
      throw Exception('Some Error Occured');
    }
  }

  Future<List<Results>> getTopRated() async{
    final response = await http.get(Uri.parse(topRatedUrl));

    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie)=> Results.fromJson(movie)).toList();
    }
    else{
      throw Exception('Some Error Occured');
    }
  }

  Future<List<Results>> getUpcoming() async{
    final response = await http.get(Uri.parse(upComigUrl));

    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie)=> Results.fromJson(movie)).toList();
    }
    else{
      throw Exception('Some Error Occured');
    }
  }
}