import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.isMenuOpen}) : super(key: key);

  final bool isMenuOpen;
  //double _sliderValue = 0.0; // Variable pour stocker la valeur sélectionnée du slider


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
      duration: Duration(milliseconds: 700), // Durée de l'animation
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }
//qsfjk<q foZQSF
  @override
  void didUpdateWidget(covariant Menu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMenuOpen) {
      _controller.forward(); // Lance l'animation vers l'état ouvert
      // Retarde l'affichage des éléments avec un délai de 300 millisecondes après que le volet soit complètement ouvert
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _showElements = true;
        });
      });
    } else {
      _controller.reverse(); // Lance l'animation vers l'état fermé
      setState(() {
        _showElements = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Libère les ressources de l'animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
          visible: _animation.value == 1.0, // Affiche les enfants uniquement lorsque le volet est complètement ouvert
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Color.fromRGBO(209, 203, 197, 1.0), // Couleur de l'enfant dans le volet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40), // Ajout d'un petit espace
                Text(
                  'Données complémentaires',
                  style: TextStyle(
                    fontSize: 22, // Augmente la taille de la police
                    fontWeight: FontWeight.bold, // Met en gras
                    fontFamily: 'Roboto', // Utilise la police Roboto
                  ),
                ),
                SizedBox(height: 40), // Espace supplémentaire
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top, // Hauteur maximale
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1), // Bordure plus fine
                        borderRadius: BorderRadius.circular(4), // Coins plus arrondis
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          //canvasColor: Colors.brown[400], // Couleur d'arrière-plan en wenge pour la liste déroulante
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: SizedBox(), // Supprime la ligne en dessous du bouton
                          hint: Text('Pays de destination'), // Titre par défaut
                          items: <String>['Japon', 'Corée du Nord', 'Antarctique', 'Haïti']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Add your logic here
                          },
                        ),
                      ),
                    ),
                  ),
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
