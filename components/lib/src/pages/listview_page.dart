import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
            SizedBox(height: 15.0,)
          ]);
    } else {
      return Container();
    }
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
          child: ListView.builder(
          itemCount: _listaNumeros.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            final image = _listaNumeros[index];
            return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/300/?images=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          }),
    );
  }
  Future<Null>obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
     new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels+20, duration: 
    Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }
}
