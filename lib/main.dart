
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale ('es','ES'),
      ],
      title: 'Componentes App',
      initialRoute: '/',
      routes:getApplicationsRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('Ruta Llamada: $settings.name');
        return MaterialPageRoute(
          builder: (BuildContext context)=> AlertPage()
        );
      },
    );
  }
  
}