import 'package:dashboard/type/search_country.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';
import 'package:dashboard/map/country_iso_util.dart';

class AppBarTile extends StatefulWidget {
  final Function(String) onCountrySelected;

  const AppBarTile({Key? key, required this.onCountrySelected})
      : super(key: key);

  @override
  _AppBarTileState createState() => _AppBarTileState();
}

class _AppBarTileState extends State<AppBarTile> {
  List<SearchCountry> countries = countryIso.entries
      .map((entry) => SearchCountry(iso: entry.key, name: entry.value))
      .toList();

  String? _selectedCountry;
  bool _isDropdownVisible =
      false; // Ajoutez ce booléen pour suivre l'état de visibilité de la liste déroulante

  void _toggleDropdownVisibility() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectCountry(String? iso) {
    setState(() {
      _selectedCountry = iso;
    });
    // Appelez le callback onCountrySelected avec l'identifiant du pays sélectionné
    widget.onCountrySelected(iso ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: app_bar_height,
        margin: const EdgeInsets.only(
          top: 10,
          left: space_between_surface,
          right: space_between_surface,
          bottom: space_between_surface,
        ),
        decoration: BoxDecoration(
          color: surface_color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const DefaultTextStyle(
                  style: TextStyle(
                    color: surface_text_color,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Signika',
                  ),
                  child: Text(
                    "WorldFlightInfo",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                alignment: Alignment.centerRight,
                child: _isDropdownVisible
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              40), // Arrondir les angles avec un rayon de 40
                          color: Colors.black.withOpacity(
                              0.15), // Changer la couleur de fond du DropdownButton
                        ),
                        child: DropdownButton<String>(
                          hint: Text(
                              '      ---------------- Choisir un pays ----------------',
                              style: TextStyle(color: Colors.white)),
                          value: _selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCountry = newValue;
                            });
                            _selectCountry(newValue);
                          },
                          items: countries.map<DropdownMenuItem<String>>(
                              (SearchCountry country) {
                            return DropdownMenuItem<String>(
                              value: country.iso,
                              child: Text('      ' + country.name),
                            );
                          }).toList(),

                          icon: Icon(Icons
                              .arrow_drop_down), // Changement de l'icône de dropdown
                          iconEnabledColor: Colors
                              .black, // Couleur de l'icône lorsque le dropdown est activé
                          iconDisabledColor: Colors
                              .grey, // Couleur de l'icône lorsque le dropdown est désactivé
                          elevation: 3, // Élévation du dropdown
                          style: TextStyle(
                              color: Colors
                                  .white), // Style du texte dans le dropdown
                          dropdownColor:
                              background_color, // Couleur de fond du dropdown
                          underline:
                              Container(), // Enlever la ligne sous le dropdown
                          //isExpanded: false, // Permettre au dropdown de s'étendre pour occuper toute la largeur
                        ),
                      )
                    : SizedBox
                        .shrink(), // Cache le DropdownButton si _isDropdownVisible est faux
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                _toggleDropdownVisibility();
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
