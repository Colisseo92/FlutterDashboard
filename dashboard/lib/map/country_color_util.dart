import 'package:flutter/material.dart';

Map<String, Color> getCountriesColor() {
  return countriesColorMap;
}

void colorCountries(Color color) {
  countriesColorMap.updateAll((key, value) => color);
}

Map<String, Color> countriesColorMap = {
  'ad': Colors.grey,
  'ae': Colors.grey,
  'af': Colors.grey,
  'ag': Colors.grey,
  'ai': Colors.grey,
  'al': Colors.grey,
  'am': Colors.grey,
  'an': Colors.grey,
  'ao': Colors.grey,
  'aq': Colors.grey,
  'ar': Colors.grey,
  'as': Colors.grey,
  'at': Colors.grey,
  'au': Colors.grey,
  'aw': Colors.grey,
  'ax': Colors.grey,
  'az': Colors.grey,
  'ba': Colors.grey,
  'bb': Colors.grey,
  'bd': Colors.grey,
  'be': Colors.grey,
  'bf': Colors.grey,
  'bg': Colors.grey,
  'bh': Colors.grey,
  'bi': Colors.grey,
  'bj': Colors.grey,
  'bl': Colors.grey,
  'bm': Colors.grey,
  'bn': Colors.grey,
  'bo': Colors.grey,
  'bq': Colors.grey,
  'br': Colors.grey,
  'bs': Colors.grey,
  'bt': Colors.grey,
  'bv': Colors.grey,
  'bw': Colors.grey,
  'by': Colors.grey,
  'bz': Colors.grey,
  'ca': Colors.grey,
  'cc': Colors.grey,
  'cd': Colors.grey,
  'cf': Colors.grey,
  'cg': Colors.grey,
  'ch': Colors.grey,
  'ci': Colors.grey,
  'ck': Colors.grey,
  'cl': Colors.grey,
  'cm': Colors.grey,
  'cn': Colors.grey,
  'co': Colors.grey,
  'cr': Colors.grey,
  'cu': Colors.grey,
  'cv': Colors.grey,
  'cw': Colors.grey,
  'cx': Colors.grey,
  'cy': Colors.grey,
  'cz': Colors.grey,
  'de': Colors.grey,
  'dj': Colors.grey,
  'dk': Colors.grey,
  'dm': Colors.grey,
  'do': Colors.grey,
  'dz': Colors.grey,
  'ec': Colors.grey,
  'ee': Colors.grey,
  'eg': Colors.grey,
  'eh': Colors.grey,
  'er': Colors.grey,
  'es': Colors.grey,
  'et': Colors.grey,
  'fi': Colors.grey,
  'fj': Colors.grey,
  'fk': Colors.grey,
  'fm': Colors.grey,
  'fo': Colors.grey,
  'fr': Colors.grey,
  'ga': Colors.grey,
  'gb': Colors.grey,
  'gd': Colors.grey,
  'ge': Colors.grey,
  'gf': Colors.grey,
  'gg': Colors.grey,
  'gh': Colors.grey,
  'gi': Colors.grey,
  'gl': Colors.grey,
  'gm': Colors.grey,
  'gn': Colors.grey,
  'gp': Colors.grey,
  'gq': Colors.grey,
  'gr': Colors.grey,
  'gs': Colors.grey,
  'gt': Colors.grey,
  'gu': Colors.grey,
  'gw': Colors.grey,
  'gy': Colors.grey,
  'hk': Colors.grey,
  'hm': Colors.grey,
  'hn': Colors.grey,
  'hr': Colors.grey,
  'ht': Colors.grey,
  'hu': Colors.grey,
  'id': Colors.grey,
  'ie': Colors.grey,
  'il': Colors.grey,
  'im': Colors.grey,
  'in': Colors.grey,
  'io': Colors.grey,
  'iq': Colors.grey,
  'ir': Colors.grey,
  'is': Colors.grey,
  'it': Colors.grey,
  'je': Colors.grey,
  'jm': Colors.grey,
  'jo': Colors.grey,
  'jp': Colors.grey,
  'ke': Colors.grey,
  'kg': Colors.grey,
  'kh': Colors.grey,
  'ki': Colors.grey,
  'km': Colors.grey,
  'kn': Colors.grey,
  'kp': Colors.grey,
  'kr': Colors.grey,
  'kw': Colors.grey,
  'ky': Colors.grey,
  'kz': Colors.grey,
  'la': Colors.grey,
  'lb': Colors.grey,
  'lc': Colors.grey,
  'li': Colors.grey,
  'lk': Colors.grey,
  'lr': Colors.grey,
  'ls': Colors.grey,
  'lt': Colors.grey,
  'lu': Colors.grey,
  'lv': Colors.grey,
  'ly': Colors.grey,
  'ma': Colors.grey,
  'mc': Colors.grey,
  'md': Colors.grey,
  'me': Colors.grey,
  'mf': Colors.grey,
  'mg': Colors.grey,
  'mh': Colors.grey,
  'mk': Colors.grey,
  'ml': Colors.grey,
  'mm': Colors.grey,
  'mn': Colors.grey,
  'mo': Colors.grey,
  'mp': Colors.grey,
  'mq': Colors.grey,
  'mr': Colors.grey,
  'ms': Colors.grey,
  'mt': Colors.grey,
  'mu': Colors.grey,
  'mv': Colors.grey,
  'mw': Colors.grey,
  'mx': Colors.grey,
  'my': Colors.grey,
  'mz': Colors.grey,
  'na': Colors.grey,
  'nc': Colors.grey,
  'ne': Colors.grey,
  'nf': Colors.grey,
  'ng': Colors.grey,
  'ni': Colors.grey,
  'nl': Colors.grey,
  'no': Colors.grey,
  'np': Colors.grey,
  'nr': Colors.grey,
  'nu': Colors.grey,
  'nz': Colors.grey,
  'om': Colors.grey,
  'pa': Colors.grey,
  'pe': Colors.grey,
  'pf': Colors.grey,
  'pg': Colors.grey,
  'ph': Colors.grey,
  'pk': Colors.grey,
  'pl': Colors.grey,
  'pm': Colors.grey,
  'pn': Colors.grey,
  'pr': Colors.grey,
  'ps': Colors.grey,
  'pt': Colors.grey,
  'pw': Colors.grey,
  'py': Colors.grey,
  'qa': Colors.grey,
  're': Colors.grey,
  'ro': Colors.grey,
  'rs': Colors.grey,
  'ru': Colors.grey,
  'rw': Colors.grey,
  'sa': Colors.grey,
  'sb': Colors.grey,
  'sc': Colors.grey,
  'sd': Colors.grey,
  'se': Colors.grey,
  'sg': Colors.grey,
  'sh': Colors.grey,
  'si': Colors.grey,
  'sj': Colors.grey,
  'sk': Colors.grey,
  'sl': Colors.grey,
  'sm': Colors.grey,
  'sn': Colors.grey,
  'so': Colors.grey,
  'sr': Colors.grey,
  'ss': Colors.grey,
  'st': Colors.grey,
  'sv': Colors.grey,
  'sx': Colors.grey,
  'sy': Colors.grey,
  'sz': Colors.grey,
  'tc': Colors.grey,
  'td': Colors.grey,
  'tf': Colors.grey,
  'tg': Colors.grey,
  'th': Colors.grey,
  'tj': Colors.grey,
  'tk': Colors.grey,
  'tl': Colors.grey,
  'tm': Colors.grey,
  'tn': Colors.grey,
  'to': Colors.grey,
  'tr': Colors.grey,
  'tt': Colors.grey,
  'tv': Colors.grey,
  'tw': Colors.grey,
  'tz': Colors.grey,
  'ua': Colors.grey,
  'ug': Colors.grey,
  'um': Colors.grey,
  'us': Colors.grey,
  'uy': Colors.grey,
  'uz': Colors.grey,
  'va': Colors.grey,
  'vc': Colors.grey,
  've': Colors.grey,
  'vg': Colors.grey,
  'vi': Colors.grey,
  'vn': Colors.grey,
  'vu': Colors.grey,
  'wf': Colors.grey,
  'ws': Colors.grey,
  'xk': Colors.grey,
  'ye': Colors.grey,
  'yt': Colors.grey,
  'za': Colors.grey,
  'zm': Colors.grey,
  'zw': Colors.grey,
};
