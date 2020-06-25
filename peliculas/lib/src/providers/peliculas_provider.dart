import 'dart:async';


import 'package:peliculas/src/models/actor_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculasProvider {
  //Se puede reemplazar por un archivo que almacene todos estos datos ya sea una .env o una clase singleton 😄
  String _apiKey = 'f141b1adfbaf57cd001c0f65975abbe9';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage=0;
  bool _loading =false;
  List<Pelicula> _populares = new List();
  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink=> _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void disposeStreams(){
    _popularesStream?.close();
  }
  Future <List<Pelicula>> _procesarRespuesta(Uri url)async{
 final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    return await _procesarRespuesta(url);

  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language,
        'query':query});
    return await _procesarRespuesta(url);

  }
  Future<List<Pelicula>> getPopulares()async{
    if(_loading)return [];

    _loading=true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page':_popularesPage.toString()});
   final resp = await _procesarRespuesta(url);
   _populares.addAll(resp);
   popularesSink(_populares);
   _loading=false;
   return resp;
  }

  Future<List<Actor>> getCast(String peliId)async{
 final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apiKey, 'language': _language});
  final resp = await http.get(url);
  final decodedData = json.decode(resp.body);
  final cast = new Cast.fromJsonList(decodedData['cast']);
  return cast.actores;
  }
}
