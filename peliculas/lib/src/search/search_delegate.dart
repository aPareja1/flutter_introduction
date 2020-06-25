import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{

  final peliculas=[
    'Spiderman',
    'Hola',
    'R',
    'No sé bro',
    'Crackina'
  ];

  final peliculasRecientes=[
    'Spiderman',
    'Capitan america',
  ];

  final peliculasProvider = new PeliculasProvider();


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query='';
          },
        )
      ];
     }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        
      ),
      onPressed: (){
       close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(height: 100.0,),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
  if(query.isEmpty){
    return Container();
  }
  return FutureBuilder(future: peliculasProvider.buscarPelicula(query) ,
  builder: (BuildContext context, AsyncSnapshot <List<Pelicula>>snapshot){
    if(snapshot.hasData){
      return ListView(
        children: snapshot.data.map((e) => 
         ListTile(
           leading: FadeInImage(
             image: NetworkImage(e.getPosterImg()),
             placeholder: AssetImage('assets/img/no-image.jpg'),
             width: 50.0,
             fit: BoxFit.contain,
           ),
           title: Text(e.title),
           subtitle: Text(e.originalTitle),
           onTap: (){
             close(context, null);
             e.uniqueId='';
             Navigator.pushNamed(context, '/detalle',arguments: e);
           },
        )).toList(),
      ); 
    }else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },);
  }


}