import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'p9nfl8rl': {
      'en': 'Garage Flipper',
      'fr': 'Grenier Rentable',
    },
    'hdn12yq3': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // AddItem
  {
    'qwkob6ko': {
      'en': 'Add New Item',
      'fr': 'Ajouter un objet',
    },
    'xa6b2n2z': {
      'en': 'Item Name',
      'fr': 'Nom de l\'objet',
    },
    '4y706djs': {
      'en': 'Enter item name',
      'fr': 'Nom de l\'objet',
    },
    'eobzzqhv': {
      'en': 'Item Description',
      'fr': 'Informations supplémentaires',
    },
    's4yuh5v3': {
      'en': 'Enter item description',
      'fr': 'Informations supplémentaires',
    },
    '9x2qdssa': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    'xwtve2ty': {
      'en': 'How many units you bought',
      'fr': 'Prix d\'achat du lot',
    },
    'lquphajp': {
      'en': 'Buy Price',
      'fr': 'Prix',
    },
    'xciu0h60': {
      'en': 'Enter you bought the item(s) for',
      'fr': 'Entrer un prix',
    },
    '99lz3s8g': {
      'en': 'Add Item',
      'fr': 'Ajouter l\'objet',
    },
    't0q7rxk8': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // SalesPage
  {
    '29esdhzc': {
      'en': 'Your sales',
      'fr': 'Grenier Rentable',
    },
    'rwyii6dy': {
      'en': 'Sales',
      'fr': 'Ventes',
    },
  },
  // EditItem
  {
    'qbcqytpy': {
      'en': 'Edit bought object:',
      'fr': 'Mettre à jour: ',
    },
    'b4lq5j5g': {
      'en': 'Leave note here...',
      'fr': 'Information supplémentaire',
    },
    'ki77o3o7': {
      'en': 'Buy price',
      'fr': 'Prix d\'achat',
    },
    'bnm9m5ub': {
      'en': 'Update item',
      'fr': 'Mettre à jour',
    },
  },
  // SellItem
  {
    '642xyja2': {
      'en': 'Additional notes',
      'fr': 'Informations supplémentaires',
    },
    'rpv5twt2': {
      'en': 'Total sell price',
      'fr': 'Total prix de vente',
    },
    'dc1t6280': {
      'en': '1',
      'fr': '',
    },
    'txwr0kso': {
      'en': 'Amont sold',
      'fr': 'Quantité vendue',
    },
    'ql8m5tos': {
      'en': '1',
      'fr': '',
    },
    'pnhq366k': {
      'en': '1',
      'fr': '',
    },
    '32c5nxuz': {
      'en': 'Sell item',
      'fr': 'Confirmer la vente',
    },
  },
  // EmptyItems
  {
    '6gui0cx7': {
      'en': 'No items found for sale',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'colxmqyc': {
      'en': 'Write to downloads',
      'fr': '',
    },
    'as9zmc20': {
      'en': '',
      'fr': '',
    },
    '5yic4jtm': {
      'en': '',
      'fr': '',
    },
    'swc4nwjb': {
      'en': '',
      'fr': '',
    },
    '1znbhiij': {
      'en': '',
      'fr': '',
    },
    'zpqxbil1': {
      'en': '',
      'fr': '',
    },
    'vm8qwo4b': {
      'en': '',
      'fr': '',
    },
    'qtqfvox7': {
      'en': '',
      'fr': '',
    },
    'moa34k6u': {
      'en': '',
      'fr': '',
    },
    '683544w0': {
      'en': '',
      'fr': '',
    },
    'vsluxqud': {
      'en': '',
      'fr': '',
    },
    '3d16apq7': {
      'en': '',
      'fr': '',
    },
    'rlk8pj1h': {
      'en': '',
      'fr': 'Mauvais format de fichier',
    },
    'ekv9lqhp': {
      'en': '',
      'fr': 'Envoi du fichier...',
    },
    '56kl5btm': {
      'en': '',
      'fr': 'Réussi',
    },
    'i8baxeqp': {
      'en': '',
      'fr': 'Problème durant l\'import',
    },
    '7cwbrvjx': {
      'en': '',
      'fr': '',
    },
    'lcp1p8ea': {
      'en': '',
      'fr': '',
    },
    'mhxrbj8d': {
      'en': '',
      'fr': '',
    },
    'zb2riq86': {
      'en': '',
      'fr': '',
    },
    '16ky2i4c': {
      'en': '',
      'fr': '',
    },
    'rj4eij61': {
      'en': '',
      'fr': '',
    },
    'dg0r4v25': {
      'en': '',
      'fr': '',
    },
    'ujxlvp48': {
      'en': '',
      'fr': '',
    },
    'ox6ge13m': {
      'en': '',
      'fr': '',
    },
    '7ip7kn1y': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
