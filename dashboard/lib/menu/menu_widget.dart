import 'package:flutter/material.dart';

class Menu extends StatelessWidget{
  const Menu({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text( //<----- INTERIEUR DU MENU A GAUCHE
          'abcd',
          textDirection: TextDirection.ltr,
        ),
        Text( //<----- INTERIEUR DU MENU A GAUCHE
          'ifizeujfz',
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }

}
