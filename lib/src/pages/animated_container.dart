import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _heigh = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  BoxShadow _boxShadow = BoxShadow(
                    color: Color(0xFF000000),
                    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          changeProperties();
        },
      ),
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _heigh,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color, boxShadow: [_boxShadow]),
        ),
      ),
    );
  }

  void changeProperties() {
    final random = Random();
  
    setState(() {
        _width = random.nextInt(300).toDouble();
     _heigh  = random.nextInt(300).toDouble();
    _color = Color.fromRGBO(
      random.nextInt(255), random.nextInt(255), random.nextInt(255)
      , 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        _boxShadow = BoxShadow(
                    color: (Colors.blue).withAlpha(80),
                    blurRadius: 10.0,
                    spreadRadius: 20.0,
                    offset: Offset(
                      0.0,
                      3.0,
                    ));

    });
  }
}
