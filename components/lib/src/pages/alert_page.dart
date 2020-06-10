import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          onPressed: () {
            _mostrarAlert(context);
          },
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Este es el contenido de la caja de alerta'),
                  FlutterLogo(size: 100,)
                ],
              ),
              actions: <Widget>[
                FlatButton(child: Text('Cancelar'),
                onPressed: ()=>Navigator.of(context).pop(),),
                   FlatButton(child: Text('Ok'),
                onPressed: ()=>Navigator.of(context).pop(),)
              ],);
        });
  }
}
