import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards'),),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
            SizedBox(height: 30.0,),
 _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
            SizedBox(height: 30.0,),
             _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
            SizedBox(height: 30.0,),
             _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
            SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(' If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on t'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 20,
      child: Column(children: <Widget>[
        FadeInImage(image: NetworkImage('https://www.telegraph.co.uk/content/dam/Travel/2017/September/patagonia-chile.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 300,
        fit: BoxFit.cover,),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No sé que wea hacer') ,)
         
      ],),
    );
  }
}