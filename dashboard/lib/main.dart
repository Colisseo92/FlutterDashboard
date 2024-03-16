import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const MyApp());
}
//Classe pour la material app -> juste là pour gérer le layout mais il n'y a "aucun" widget" dedans
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: dashboardTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  double _width = 100;
  double _height = 100;
  MaterialColor c = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);

  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink,
      ),
      body: Row(
        children: <Widget>[
          InkWell(
            child: AnimatedContainer(
              alignment: Alignment.center,
              height: _height,
              width: _width,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: c,
                borderRadius: _borderRadius,
              ),
              child: Column(
                  children: <Widget>[
                    Text( //<----- INTERIEUR DU MENU A GAUCHE
                      'NOM DU PAYS',
                      textDirection: TextDirection.ltr,
                    ),
                    Text( //<----- INTERIEUR DU MENU A GAUCHE
                      'abcd',
                      textDirection: TextDirection.ltr,
                    ),
                    Text( //<----- INTERIEUR DU MENU A GAUCHE
                      'ifizeujfz',
                      textDirection: TextDirection.ltr,
                    ),
                  ]
              ),
            ),
            onTap: () {
              setState(() {
                if(isMenuOpen){
                  _width = 100;
                  _height = 100;
                  _borderRadius = BorderRadius.circular(50);
                  c = Colors.blue;
                  isMenuOpen = false;
                }else{
                  _width = MediaQuery.of(context).size.width*0.3;
                  _height = MediaQuery.of(context).size.height;
                  _borderRadius = BorderRadius.circular(0);
                  c = Colors.red;
                  isMenuOpen = true;
                }
              });
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromRGBO(0,255,0,1.0),
              child: const Text(
                'Map',
                textDirection: TextDirection.ltr,
              )
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(45, 52, 54,1.0),
    );
  }
}