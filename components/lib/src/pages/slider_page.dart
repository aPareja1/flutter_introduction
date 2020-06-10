import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double sliderValue = 100.0;
  bool _bloquearCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[_crearSlider(),
          Expanded(child:_crearImagen() ),
          _crearCheckbox(),
           _crearSwitch() ],
                             ),
                           ),
                         );
                       }
                     
                       Widget _crearSlider() {
                         return Slider(
                           activeColor: Colors.indigoAccent,
                           label: 'Tamaño de la imagen',
                           divisions: 20,
                           onChanged: (_bloquearCheck)? null : (valor) {
                             setState(() {
                               sliderValue = valor;
                             });
                           },
                           value: sliderValue,
                           min: 10.0,
                           max: 400.0,
                         );
                       }
                     
                       Widget _crearImagen() {
                         return Image(
                           width: sliderValue,
                           fit:BoxFit.contain,
                           image: NetworkImage(
                             
                               'https://elvortex.com/wp-content/uploads/2019/10/juan-carlos-bodoque.jpg'),
                         );
                       }
                     
                      Widget  _crearCheckbox() {
                        return CheckboxListTile(
                          title: Text('Bloquear slider'),
                          value: _bloquearCheck,
                          onChanged: (valor){
                            setState(() {
                            _bloquearCheck=valor;
                             
                            });
                           },
                        );
                      }
           
            Widget _crearSwitch() {
                  return SwitchListTile(
                          title: Text('Bloquear slider'),
                          value: _bloquearCheck,
                          onChanged: (valor){
                            setState(() {
                            _bloquearCheck=valor;
                             
                            });
                           },
                        );
             }
}
