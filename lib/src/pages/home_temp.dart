import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  

  final  opciones = ['Uno','Dos','Tres'];

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World'),
        ),
        body: ListView(
          children: _crearItemsCorta()
        ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List();
    for (String opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista.add(tempWidget);
    }
    return lista;
  }
  List<Widget> _crearItemsCorta(){
    return   opciones.map((item){
      return ListTile(
        title: Text(item + '!'),
        subtitle: Text('Cualquier cosa'),
        leading: Icon(Icons.account_balance_wallet),
        trailing: Icon(Icons.keyboard_arrow_right),
      );
    }).toList();
    
  }
}