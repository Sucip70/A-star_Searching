List<String> getDataset() {
  List<String> _query = [
    'sate',
    'ayam goreng',
    'sop',
    'bakso',
    'mie ayam',
    'kare',
    'nasi goreng',
    'nasi kuning',
    'nasi ayam',
    'nasi kucing',
    'gudeg',
    'es teh',
    'jus',
    'kopi',
    'pizza',
    'martabak manis',
    'martabak asin',
    'seblak',
    'tahu lontong',
    'rendang',
    'bubur ayam',
    'cumi',
    'cap cay',
    'kebab',
    'terang bulan'
  ];
  return _query;
}

List<String> getResDataset(String s) {
  int index = getDataset().indexOf(s);
  Map<int, List<String>> _query = {
    -1: [],
    0: ['Sate Ayam Pak Wan', 'Sate Kambing Solo', 'Sate Kudus'],
    1: ['KFC', 'Mc Donald', 'Oliv Chicken'],
    2: ['Sop Iga Sapi Karanganyar', 'Sop Ayam Pak Ji'],
    3: ['Mie Ayam Bakso Pak Tejo', 'Bakso Granat Kilisuci', 'Bakso Mercon'],
    4: ['Mie Ayam Bakso Pak Tejo', 'Mie Ayam Solo', 'Mie Aceh Mas Otong'],
    5: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    6: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    7: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    8: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    9: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    10: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    11: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    12: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    13: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    14: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    15: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    16: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    17: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    18: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    19: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    20: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    21: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    22: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    23: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    24: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ],
    25: [
      'Kedai Modified',
      'Warkop Happy',
      'Kedai Pak Miko',
      'Rumah Makan Bu Ana',
      'Warung Gunung'
    ]
  };
  return _query[index];
}

List<String> getQueryDataset(List<String> _query, String s) {
  List<String> tmp = [];
  for (int i = 0; i < _query.length; i++) {
    if (_query[i].contains(s)) tmp.add(_query[i]);
  }
  return tmp;
}

String getDataAtIndex(List<String> _query, var i) {
  return _query[i];
}
