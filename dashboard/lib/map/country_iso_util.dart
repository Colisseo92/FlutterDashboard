String? getCountryWithIso(String iso) {
  if (countryIso.containsKey(iso)) {
    return countryIso[iso];
  }
  return "";
}

Map<String, String> countryIso = {
  "af": "Afghanistan",
  "za": "Afrique du Sud",
  "ax": "Åland",
  "al": "Albanie",
  "dz": "Algérie",
  "de": "Allemagne",
  "ad": "Andorre",
  "ao": "Angola",
  "ai": "Anguilla",
  "aq": "Antarctique",
  "ag": "Antigua and Barbuda",
  "sa": "Arabie Saoudite",
  "ar": "Argentine",
  "am": "Arménie",
  "aw": "Aruba",
  "au": "Australie",
  "at": "Autriche",
  "az": "Azerbaïdjan",
  "bs": "Bahamas",
  "bh": "Bahreïn",
  "bd": "Bangladesh",
  "bb": "Barbade",
  "be": "Belgique",
  "bz": "Belize",
  "bj": "Benin",
  "bm": "Bermude",
  "bt": "Bhoutan",
  "by": "Biélorussie",
  "mm": "Birmanie",
  "bo": "Bolivie",
  "ba": "Bosnie-Herzégovine",
  "bw": "Botswana",
  "br": "Brésil",
  "bn": "Brunei Darussalam",
  "bg": "Bulgarie",
  "bf": "Burkina Faso",
  "bi": "Burundi",
  "kh": "Cambodge",
  "cm": "Cameroun",
  "ca": "Canada",
  "cv": "Cap Vert",
  "cy": "Chypre",
  "cl": "Chili",
  "cn": "Chine",
  "co": "Colombie",
  "km": "Comores",
  "cg": "Congo",
  "kp": "Corée du Nord",
  "kr": "Corée du Sud",
  "cr": "Costa Rica",
  "hr": "Croatie",
  "ci": "Côte d'Ivoire",
  "cu": "Cuba",
  "cw": "Curaçao",
  "dk": "Danemark",
  "dj": "Djibouti",
  "dm": "Dominique",
  "eg": "Egypte",
  "ae": "Emirats Arabes Unis",
  "ec": "Equateur",
  "er": "Erythrée",
  "es": "Espagne",
  "ee": "Estonie",
  "sz": "Eswatini",
  "us": "Etats-Unis d'Amérique",
  "et": "Ethiopie",
  "fj": "Fidji",
  "fi": "Finlande",
  "fr": "France",
  "ga": "Gabon",
  "gm": "Gambie",
  "ge": "Géorgie",
  "gs": "Géorgie du Sud et Îles Sandwich du Sud",
  "gh": "Ghana",
  "gi": "Gibraltar",
  "gr": "Grèce",
  "gd": "Grenade",
  "gl": "Groenland",
  "gp": "Guadeloupe",
  "gu": "Guam",
  "gt": "Guatemala",
  "gg": "Guernesey",
  "gn": "Guinée",
  "gw": "Guinée-Bissau",
  "gq": "Guinée équatoriale",
  "gy": "Guyane",
  "gf": "Guyane Française",
  "ht": "Haïti",
  "hn": "Honduras",
  "hk": "Hong Kong",
  "hu": "Hongrie",
  "bv": "Île Bouvet",
  "ky": "Îles Caïmans",
  "cx": "Île Christmas",
  "cc": "Îles Cocos",
  "ck": "Îles Cook",
  "fk": "Îles Falkland",
  "fo": "Îles Féroé",
  "hm": "Îles Heard et McDonald",
  "nf": "Île Norfolk",
  "im": "Île de Man",
  "mp": "Îles Mariannes du Nord",
  "mh": "Îles Marshall",
  "mu": "Île Maurice",
  "um": "Îles mineures éloignées des États-Unis",
  "pn": "Îles Pitcairn",
  "sb": "Îles Salomon",
  "tc": "Îles Turques-et-Caïques",
  "vg": "Îles Vierges britanniques",
  "vi": "Îles Vierges des États-Unis",
  "in": "Inde",
  "id": "Indonésie",
  "ir": "Iran",
  "iq": "Irak",
  "ie": "Irlande",
  "is": "Islande",
  "il": "Israël",
  "it": "Italie",
  "jm": "Jamaïque",
  "jp": "Japon",
  "je": "Jersey",
  "jo": "Jordanie",
  "kz": "Kazakhstan",
  "ke": "Kenya",
  "kg": "Kirghizistan",
  "ki": "Kiribati",
  "xk": "Kosovo",
  "kw": "Koweït",
  "la": "Laos",
  "re": "La Réunion",
  "ls": "Lesotho",
  "lv": "Lettonie",
  "lb": "Liban",
  "lr": "Libéria",
  "ly": "Libye",
  "li": "Liechtenstein",
  "lt": "Lituanie",
  "lu": "Luxembourg",
  "mo": "Macao",
  "mk": "Macédoine du Nord",
  "mg": "Madagascar",
  "my": "Malaisie",
  "mw": "Malawi",
  "mv": "Maldives",
  "ml": "Mali",
  "mt": "Malte",
  "ma": "Maroc",
  "mq": "Martinique",
  "mr": "Mauritanie",
  "yt": "Mayotte",
  "mx": "Mexique",
  "fm": "Micronésie",
  "md": "Moldavie",
  "mc": "Monaco",
  "mn": "Mongolie",
  "me": "Monténégro",
  "ms": "Montserrat",
  "mz": "Mozambique",
  "na": "Namibie",
  "nr": "Nauru",
  "np": "Népal",
  "nc": "Nouvelle Calédonie",
  "nz": "Nouvelle Zélande",
  "ni": "Nicaragua",
  "ne": "Niger",
  "ng": "Nigeria",
  "nu": "Niué",
  "no": "Norvège",
  "om": "Oman",
  "ug": "Ouganda",
  "uz": "Ouzbékistan",
  "pk": "Pakistan",
  "pw": "Palaos",
  "ps": "Palestine",
  "pa": "Panama",
  "pg": "Papouasie-Nouvelle-Guinée",
  "py": "Paraguay",
  "nl": "Pays-Bas",
  "bq": "Pays-Bas caribéens",
  "pe": "Pérou",
  "ph": "Philippines",
  "pl": "Pologne",
  "pf": "Polynésie Française",
  "pt": "Portugal",
  "pr": "Porto Rico",
  "qa": "Qatar",
  "cf": "République Centrale d'Afrique",
  "do": "République Dominicaine",
  "cd": "République Démocratique du Congo",
  "cz": "République Tchèque",
  "ro": "Roumanie",
  "gb": "Royaume-Uni",
  "ru": "Russie",
  "rw": "Rwanda",
  "eh": "Sahara occidental",
  "bl": "Saint Barthélemy",
  "kn": "Saint-Christophe-et-Niévès",
  "sh": "Sainte-Hélène",
  "lc": "Sainte-Lucie",
  "mf": "Saint Martin",
  "pm": "Saint Pierre and Miquelon",
  "vc": "Saint Vincent-et-les-Grenadines",
  "sv": "Salvador",
  "ws": "Samoa",
  "sm": "Saint-Marin",
  "st": "Sao Tomé et Principe",
  "sn": "Senegal",
  "rs": "Serbie",
  "sc": "Seychelles",
  "sl": "Sierra Leone",
  "sg": "Singapour",
  "sx": "Saint Martin (partie allemande)",
  "sk": "Slovaquie",
  "si": "Slovénie",
  "so": "Somalie",
  "ss": "Soudan du Sud",
  "as": "Samoa Américaine",
  "lk": "Sri Lanka",
  "sd": "Soudan",
  "sr": "Suriname",
  "sj": "Svalbard",
  "se": "Suède",
  "ch": "Suisse",
  "sy": "Syrie",
  "tw": "Taiwan",
  "tj": "Tajikistan",
  "tz": "Tanzanie",
  "td": "Tchad",
  "tf": "Terres australes et antarctiques françaises",
  "io": "Territoire britannique de l'océan Indien",
  "th": "Thailande",
  "tl": "Timor-Leste",
  "tg": "Togo",
  "tk": "Tokelau",
  "to": "Tonga",
  "tt": "Trinidad et Tobago",
  "tn": "Tunisie",
  "tr": "Turquie",
  "tm": "Turkménistan",
  "tv": "Tuvalu",
  "ua": "Ukraine",
  "uy": "Uruguay",
  "vu": "Vanuatu",
  "va": "Vatican",
  "ve": "Venezuela",
  "vn": "Vietnam",
  "wf": "Wallis et Futuna",
  "ye": "Yémen",
  "zm": "Zambie",
  "zw": "Zimbabwe"
};
