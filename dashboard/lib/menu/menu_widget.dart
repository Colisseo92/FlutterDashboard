import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:country_icons/country_icons.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.isMenuOpen}) : super(key: key);

  final bool isMenuOpen;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showElements = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(covariant Menu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMenuOpen) {
      _controller.forward();
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _showElements = true;
        });
      });
    } else {
      _controller.reverse();
      setState(() {
        _showElements = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
          visible: _animation.value == 1.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Color.fromRGBO(209, 203, 197, 1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Nom du pays',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 40),
                ExpansionTileCard(
                  leading: Image.asset(
                    'flags/fr.jpg',
                  ),

                  //CircleAvatar(
                    //backgroundImage: AssetImage('plane.jpg'),
                    //radius: 50, // ajustez le rayon en fonction de vos besoins
                  //),
                  title: Text('Pays 1'),

                  subtitle: Text("Nombres de villes / d'aéroports"),
                  children: <Widget>[
                    Divider(thickness: 1.0, height: 1.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          """Ville 1\nVille 2""",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Slider(
                  value: 0.0,
                  min: 0.0,
                  max: 14,
                  divisions: 10,
                  label: 'Temps de trajet',
                  onChanged: (double value) {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
