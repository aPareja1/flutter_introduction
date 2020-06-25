import 'package:flutter/material.dart';

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
  final listaSugerida = query.isEmpty?peliculasRecientes:peliculas.where(
    (element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
  return ListView.builder(itemCount: listaSugerida.length,
  itemBuilder: (context,i){
    return ListTile(
      leading: Icon(Icons.movie),
      title: Text(peliculasRecientes[i]),
    );
  },);
  }


}