import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  List  <String> _poderes = ['Volar','Rayos x','Super fuerza'];
  String opcionSeleccionada ='Volar';
  TextEditingController  _inputFieldDateController  = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
                    Divider(),
                    _crearPersona(),
                    
                  ],
                ),
              );
            }
          
            Widget _crearInput() {
              return TextField(
                onChanged: (valor) {
                  setState(() {
                    _nombre = valor;
                  });
                },
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    counter: Text('Letras ${_nombre.length}'),
                    hintText: 'Nombre de la persona',
                    labelText: 'Nombre',
                    helperText: 'Sólo es el nombre',
                    suffixIcon: Icon(Icons.accessibility),
                    icon: Icon(Icons.account_circle)),
              );
            }
          
            Widget _crearPersona() {
              return ListTile(
                title: Text('Nombre es : $_email'),
              );
            }
          
            Widget _crearEmail() {
              return TextField(
                onChanged: (valor) => setState(() {
                  _email = valor;
                }),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Email',
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.alternate_email),
                    icon: Icon(Icons.email)),
              );
            }
          
            Widget _crearPassword() {
              return TextField(
                onChanged: (valor) => setState(() {
                  _email = valor;
                }),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Password',
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock_open),
                    icon: Icon(Icons.lock)),
              );
            }
          
            Widget _crearFecha(BuildContext context) {
              return TextField(
                controller: _inputFieldDateController,
                enableInteractiveSelection: false,
                onTap: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            hintText: 'Fecha de nacimiento',
                            labelText: 'Fecha de nacimiento',
                            suffixIcon: Icon(Icons.perm_contact_calendar),
                            icon: Icon(Icons.calendar_today)),
                      );
                    }
                  
                    void _selectDate(BuildContext context)async {
                      DateTime picked =await showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime(2018),
                        lastDate: new DateTime(2025),
                        locale: Locale('es','ES')
                      );
                      if (picked!=null){
                        setState(() {
                          _fecha = picked.toString();
                          _inputFieldDateController.text=_fecha;
                        });
                      }
          
                    }
            List<DropdownMenuItem<String>> getOpcionesDropDown(){
              List<DropdownMenuItem<String>> lista = List();
              _poderes.forEach((poder){
                lista.add(DropdownMenuItem(child: Text(poder),
                value: poder,));
              });
              return lista;
            }
            Widget _crearDropdown() {
              return  Row(
                children: <Widget>[
                  Icon(Icons.select_all),
                  SizedBox(width: 30.0,),
                  Expanded(
                                      child: DropdownButton(
                      value: opcionSeleccionada,
                      items: getOpcionesDropDown(),
                      onChanged: (opt){
                        setState(() {
                        opcionSeleccionada=opt;
   
                        });
                       
                      },
                    ),
                  ),
                ],
              );
            }
}
