import 'package:kanigara/_excel.dart';
import 'dart:math';

class Edge {
  List<int> to;
  List<double> distance;

  Edge(List<int> v, List<double> d) {
    this.to = v;
    this.distance = d;
  }
}

class Pair {
  int first;
  double second;
  Pair(int a, double b) {
    this.first = a;
    this.second = b;
  }
}

class ASearch {
  DataConfiguration dataConfiguration;
  List<Loc> dot = [];
  List<Edge> link = [];

  ASearch() {
    getLinkData();
    getResData();
  }

  void getResData() {
    Map<int, List<String>> d = {
      0: [
        'Universitas Sebelas Maret',
        '-',
        '0',
        '0',
        '-7.5557471',
        '110.854522',
        'Jl.Ir.Sutami No.36 A Kentingan Surakarta, Jebres, Kec. Jebres, Kota Surakarta, Jawa Tengah 57129'
      ],
      1: [
        'RM Timlo Solo',
        'restoran Jawa',
        '4.2',
        '2',
        '-7.564408003',
        '110.8346421',
        'Jl. Jend. Urip Sumoharjo No.94'
      ],
      2: [
        'Warung Selat Mbak Lies',
        'restoran Jawa',
        '4.3',
        '2',
        '-7.582222499',
        '110.8182013',
        'Jl. Veteran Gg. II No.42'
      ],
      3: [
        'Pecel Solo',
        'restoran Jawa, sayur',
        '4.3',
        '2',
        '-7.562304262',
        '110.8147163',
        'Turisari, Jl. Prof. DR. Supomo No.55'
      ],
      4: [
        'Mang Engking Solo',
        'seafood, makanan klasik',
        '4.4',
        '2',
        '-7.560190803',
        '110.7721039',
        'Jalan Ahmad Yani KM 7, Pabelan, Kartasura'
      ],
      5: [
        'RM Goela Klapa',
        'makanan klasik Indonesia',
        '4.2',
        '2',
        '-7.556405653',
        '110.8094096',
        'Jl. Menteri Supeno No.3'
      ],
      6: [
        'Waroeng Mbok Marni',
        'nasi goreng',
        '4.1',
        '2',
        '-7.560009001',
        '110.7882303',
        'Solo Square Mall, Jl. Slamet Riyadi'
      ],
      7: [
        'Kuliner Malam',
        'makanan klasik Indonesia, pedas',
        '4.0',
        '2',
        '-7.550989238',
        '110.8346647',
        'Jl. Letjen Sutoyo No.17'
      ],
      8: [
        'Bakso Kadipolo',
        'bakso',
        '4.4',
        '2',
        '-7.565761834',
        '110.8162966',
        'Jl. Ronggowarsito No.163'
      ],
      9: [
        'Tiga Tjeret Cafe',
        'restoran Jawa',
        '4.2',
        '2',
        '-7.568040016',
        '110.8228883',
        'Jl. Ronggowarsito No.97'
      ],
      10: [
        'Waroeng Mbok Marni',
        'sate',
        '4.3',
        '1',
        '-7.56549806',
        '110.808694',
        'Solo Grand Mall Lantai 3, Jalan Brigjend Slamet Riyadi No. 273'
      ],
      11: [
        'Sate Kambing Mbok Galak',
        'sate, olahan kambing',
        '4.4',
        '2',
        '-7.544438352',
        '110.8089728',
        'Jl. Ki Mangun Sarkoro No.112'
      ],
      12: [
        'Tengkleng Klewer Bu Edi',
        'olahan kambing',
        '4.3',
        '1',
        '-7.572928559',
        '110.8320922',
        'Wisata Kuliner Galabo Solo, Jl. Mayor Sunaryo No.32'
      ],
      13: [
        'Rumah Makan KUSUMA',
        'restoran Padang',
        '4.1',
        '1',
        '-7.565432561',
        '110.8116003',
        'Jalan Purwonegaran, RT 02 / RW 06, Laweyan, Sriwedari'
      ],
      14: [
        'Epice Restaurant',
        'prasmanan',
        '4.7',
        '2',
        '-7.558669818',
        '110.7864179',
        'inside Alila Solo, Slamet Riyadi St No.562'
      ],
      15: [
        'Soto Triwindu',
        'soto',
        '4.5',
        '2',
        '-7.568724052',
        '110.823809',
        'Jl. Teuku Umar, RT.001/RW.001, Keprabon'
      ],
      16: [
        'Bakso Alex Mangkunegaran',
        'bakso',
        '4.5',
        '2',
        '-7.565363379',
        '110.8205445',
        'Jl. Yosodipuro No.12B, Ketelan'
      ],
      17: [
        'Dapur Solo Edupark',
        'prasmanan',
        '4.5',
        '1',
        '-7.545772471',
        '110.7732013',
        'Jl. Adi Sucipto, Karangasem'
      ],
      18: [
        'Gudeng Ceker Margoyudan Bu Kasno',
        'restoran jawa',
        '4.4',
        '2',
        '-7.558590189',
        '110.8302894',
        'Jalan Wolter Monginsidi No.41-43, Setabelan'
      ],
      19: [
        "D'Cost Seafood Solo Square",
        'seafood',
        '4.3',
        '2',
        '-7.560865868',
        '110.7890842',
        'Solo Square, Jl. Slamet Riyadi No.1'
      ],
      20: [
        'Istana Mie & Es',
        'olahan mie',
        '3.8',
        '1',
        '-7.560471997',
        '110.8102412',
        'Jalan Yosodipuro Solo Paragon Mall Food Walk GF 5'
      ],
      21: [
        'Omah Selat',
        'restoran jawa',
        '4.5',
        '1',
        '-7.566263322',
        '110.8432449',
        'Jl. Gotong Royong No.13, Jagalan'
      ],
      22: [
        'Harjo Bestik Pasar Kembang',
        'restoran jawa',
        '4.2',
        '1',
        '-7.572513772',
        '110.817234',
        'JL. Dr Rajiman, Kemlayan'
      ],
      23: [
        'Kedai Makan Putri Solo',
        'restoran jawa',
        '4.4',
        '2',
        '-7.557581241',
        '110.7978468',
        'Jl. A. Yani No.399, Kerten'
      ],
      24: [
        'Pondok Jowi',
        'restoran Bali',
        '4.4',
        '2',
        '-7.552316115',
        '110.8051574',
        'Jl. Kasuari II No.1, Manahan'
      ],
      25: [
        'Nasi Liwet Bu Wongso Lemu',
        'restoran jawa, tahu',
        '3.8',
        '2',
        '-7.56945707',
        '110.8239782',
        'Jl. Teuku Umar, Keprabon'
      ],
      26: [
        'Sate Kambing Asli Tambak Segaran',
        'olahan kambing',
        '4.1',
        '2',
        '-7.563987614',
        '110.8268018',
        'Jl. Sutan Syahrir No.149, Setabelan'
      ],
      27: [
        'Warung Soto Ayam Gading Wetan',
        'soto',
        '4.5',
        '1',
        '-7.583998195',
        '110.8276019',
        'Jl. Veteran No.49, Joyosuran'
      ],
      28: [
        'Karonssih Culinary & Craft',
        'western, café',
        '4.3',
        '2',
        '-7.563961898',
        '110.810745',
        'Jl. Dr. Sutomo No.24, Sriwedari'
      ],
      29: [
        'Dapur Solo Rumah Makan',
        'prasmanan',
        '4.4',
        '2',
        '-7.545712528',
        '110.7730698',
        'Jl. Adi Sucipto No.33, Blulukan'
      ],
      30: [
        'Marakez Café',
        'masakan timur tengah',
        '4.4',
        '2',
        '-7.577838062',
        '110.8351575',
        'Jl. Untung Suropati No.76'
      ],
      31: [
        'RM Adem Ayem',
        'restoran jawa, makanan klasik indonesia',
        '4.4',
        '2',
        '-7.565834292',
        '110.8093339',
        'Jl. Slamet Riyadi No.342, Penumping'
      ],
      32: [
        'Warung Mekar Sari',
        'salad, vegetarian',
        '4.3',
        '2',
        '-7.572976278',
        '110.8193198',
        'Jl. DR. Radjiman No.168A'
      ],
      33: [
        'Coconuts Resto',
        'western, steak',
        '4.3',
        '2',
        '-7.58728678',
        '110.8187428',
        'Jl. Yos Sudarso No.361, Danukusuman'
      ],
      34: [
        'Saffron Resto & Meatshop',
        'western',
        '4.5',
        '2',
        '-7.56930244',
        '110.8272486',
        'Jl. Ronggowarsito No.38, Kp. Baru'
      ],
      35: [
        "Solo's Bistro",
        'olahan mie',
        '4.4',
        '2',
        '-7.570012353',
        '110.8204798',
        'Jl. Slamet Riyadi No.183, Kemlayan'
      ],
      36: [
        "Arje's Kitchen",
        'makanan klasik indonesia, western, café',
        '4.4',
        '2',
        '-7.555906738',
        '110.8627627',
        'Jl. Antariksa No.2, Jebres'
      ],
      37: [
        'RM Pecel Bu Kis',
        'sayur, vegetarian, tahu',
        '4.3',
        '1',
        '-7.566472728',
        '110.8154665',
        'JL. Gleges, Sriwedari, Laweyan'
      ],
      38: [
        'Tengkleng Klewer Ibu Edi',
        'olahan kambing',
        '4.3',
        '2',
        '-7.574676673',
        '110.827694',
        'PASAR KLEWER SOLO, Jl. DR. Radjiman, Kauman'
      ],
      39: [
        'Lezaat Rumah Makan',
        'olahan kambing',
        '4.7',
        '2',
        '-7.578076506',
        '110.8332265',
        'Jl. Kaliwidas No.52, Ps. Kliwon'
      ],
      40: [
        'Rumah Banjar Garden Resto',
        'olahan kambing',
        '4.4',
        '2',
        '-7.556144489',
        '110.7887217',
        'Jl. Basuki Rahmat No.54, Jajar'
      ],
      41: [
        'Angkring Solo',
        'restoran Jawa',
        '4.0',
        '2',
        '-7.549349049',
        '110.7857148',
        'Jl. Adi Sucipto No.129, Jajar'
      ],
      42: [
        'RM Padang Sederhana Solo',
        'restoran Padang',
        '4.4',
        '2',
        '-7.559608205',
        '110.7870475',
        'Jl. Slamet Riyadi No.469, Pajang'
      ],
      43: [
        'Kusuma Sari Restaurant & Ice Cream',
        'restoran Jawa, sup',
        '4.4',
        '2',
        '-7.570797341',
        '110.8246339',
        'Jl. Slamet Riyadi No.111, Kemlayan'
      ],
      44: [
        'Suka Sambal',
        'makanan klasik Indonesia, pedas',
        '4.4',
        '2',
        '-7.564055189',
        '110.8117947',
        'Solo Grand Mall, Lantai 3, Jl. Slamet Riyadi No.273'
      ],
      45: [
        "Selat Vien's Pusat",
        'restoran Jawa, vegetarian',
        '4.4',
        '1',
        '-7.557712246',
        '110.8176056',
        'Jl. Hasanudin No.99 D/E, Punggawan'
      ],
      46: [
        'Rumah Makan "Murah Meriah"',
        'restoran Padang',
        '5.0',
        '1',
        '-7.54916102',
        '110.830802',
        'Jl. Mr. Sartono No.37, Nusukan'
      ],
      47: [
        'WARUNG MAKAN TENDA BIRU',
        'restoran Jawa',
        '4.5',
        '1',
        '-7.535724637',
        '110.8410805',
        'Mojosongo, Kec. Jebres'
      ],
      48: [
        'Rumah Makan Pak Die Solo Balapan',
        'restoran jawa, makanan klasik indonesia',
        '4.3',
        '1',
        '-7.558101252',
        '110.8222136',
        'Kestalan, Kec. Banjarsari, Kota Surakarta'
      ],
      49: [
        'RM Nini Thowong',
        'restoran Jawa',
        '4.3',
        '2',
        '-7.56520734',
        '110.8309555',
        'Jl. Arifin No.59, Kepatihan Wetan'
      ],
      50: [
        'Warung Nasi goreng Agus',
        'nasi goreng',
        '4.4',
        '1',
        '-7.595659659',
        '110.8181734',
        'Kp. Madegondo, RT. 12, Grogol'
      ],
      51: [
        'Nasi Kebuli Mbah Soleh Ngru-Q',
        'nasi goreng, restoran timur tengah',
        '4.3',
        '2',
        '-7.567712458',
        '110.7979015',
        'Jl. Perintis Kemerdekaan No.66, Sondakan'
      ],
      52: [
        'Warung Tengkleng Mbak Diah',
        'olahan kambing',
        '4.2',
        '2',
        '-7.59139282',
        '110.8158222',
        'Desa Tanjunganom RT.002 / RW.001, Kwarasan, Grogol'
      ],
      53: [
        'Mie Gajah Mas',
        'mie, masakan china',
        '4.2',
        '1',
        '-7.568817038',
        '110.8309421',
        'Jl. Suryopranoto No.1, Kepatihan Wetan'
      ],
      54: [
        'Nasi Liwet Bu Sarmi',
        'restoran jawa, olahan kambing',
        '4.3',
        '2',
        '-7.572656748',
        '110.8329138',
        'Jl. Kapten Mulyadi, Kedung Lumbu'
      ],
      55: [
        'Marugame Udon, Solo Paragon Mall',
        'restoran Jepang',
        '4.6',
        '2',
        '-7.56233822',
        '110.8100488',
        'Solo Paragon Mall, Jl. Yosodipuro No.133'
      ],
      56: [
        'Galabo Kuliner Malam Solo',
        'makanan klasik Indonesia',
        '4.2',
        '2',
        '-7.572183201',
        '110.8298642',
        'Kedung Lumbu, Kec. Ps. Kliwon'
      ],
      57: [
        'Bengawan Solo Resto',
        'olahan kambing',
        '3.6',
        '2',
        '-7.559719483',
        '110.8055767',
        'Jl. Hasanudin No.47, Purwosari'
      ]
    };
    for (int i = 0; i < d.length; i++) {
      List<String> tmp = List.from(d[i]);
      Loc tmp2 = new Loc(
          i,
          tmp[0],
          tmp[1],
          double.parse(tmp[2]),
          int.parse(tmp[3]),
          double.parse(tmp[4]),
          double.parse(tmp[5]),
          tmp[6]);
      dot.add(tmp2);
    }
  }

  void getLinkData() {
    Map<int, List<int>> l = {
      0: [1, 7, 18, 36],
      1: [0, 21, 49, 56],
      2: [27],
      3: [37, 44],
      4: [42],
      5: [24, 45, 55],
      6: [14, 19, 42],
      7: [0, 46, 47],
      8: [9, 37],
      9: [8, 15, 16],
      10: [31, 35, 51],
      11: [24],
      12: [27, 38, 39, 54],
      13: [31, 37, 44],
      14: [6, 40, 41, 42],
      15: [9, 34],
      16: [9, 26, 48],
      17: [29, 41],
      18: [0, 26, 46, 48],
      19: [6, 23],
      20: [44, 55],
      21: [1, 36],
      22: [32, 35],
      23: [19, 24, 55],
      24: [5, 11, 23],
      25: [35, 43, 56],
      26: [16, 18, 49],
      27: [2, 12],
      28: [44, 55],
      29: [17],
      30: [39],
      31: [10, 13],
      32: [22, 38],
      33: [43, 52],
      34: [15, 53, 56],
      35: [10, 22, 25],
      36: [0, 21],
      37: [3, 8, 13],
      38: [12, 32, 56],
      39: [12, 30],
      40: [14, 41],
      41: [14, 17, 40],
      42: [4, 6, 14],
      43: [25, 33],
      44: [3, 13, 20, 28],
      45: [5, 48, 55],
      46: [7, 18],
      47: [7],
      48: [16, 18, 45],
      49: [1, 26, 53],
      50: [52],
      51: [10, 57],
      52: [33, 50],
      53: [34, 49],
      54: [12, 56],
      55: [5, 20, 23, 28, 45, 57],
      56: [1, 25, 34, 38, 54],
      57: [51, 55]
    };

    Map<int, List<double>> d = {
      0: [2.3, 3.1, 2.6, 1.4],
      1: [2.3, 1.3, 0.55, 1.3],
      2: [1.1],
      3: [0.55, 2.6],
      4: [2.3],
      5: [0.7, 2.2, 1.8],
      6: [0.6, 3, 2.8],
      7: [3.1, 0.28, 2.6],
      8: [0.75, 0.22],
      9: [0.75, 0.16, 0.5],
      10: [0.65, 1.5, 1.5],
      11: [2.7],
      12: [1.6, 0.8, 0.85, 1.3],
      13: [0.35, 0.55, 0.5],
      14: [0.6, 0.45, 1.8, 0.35],
      15: [0.16, 0.5],
      16: [0.5, 0.9, 1, 3],
      17: [0.006, 1.6],
      18: [2.6, 0.85, 1.2, 0.9],
      19: [3, 1.1],
      20: [3.4, 0.005],
      21: [1.3, 5.1],
      22: [0.24, 0.75],
      23: [1.1, 2.6, 3.9],
      24: [0.7, 2.7, 2.6],
      25: [0.45, 0.23, 0.85],
      26: [0.9, 0.85, 0.5],
      27: [1.1, 1.6],
      28: [3.1, 0.6],
      29: [0.006],
      30: [0.85],
      31: [0.65, 0.35],
      32: [0.24, 1.0],
      33: [3.1, 0.65],
      34: [0.5, 0.55, 0.55],
      35: [1.5, 0.75, 0.45],
      36: [1.4, 5.1],
      37: [0.55, 0.22, 0.55],
      38: [0.8, 1.0, 0.5],
      39: [0.85, 0.35],
      40: [0.45, 1.3],
      41: [1.8, 1.6, 1.3],
      42: [2.3, 2.8, 0.35],
      43: [0.23, 3.1],
      44: [2.6, 0.5, 3.4, 3.1],
      45: [2.2, 1.4, 1.3],
      46: [0.28, 1.2],
      47: [2.6],
      48: [1.3, 0.9, 1.4],
      49: [0.55, 0.5, 0.55],
      50: [1.0],
      51: [1.5, 1.4],
      52: [0.65, 1.0],
      53: [0.55, 0.55],
      54: [1.3, 0.45],
      55: [1.8, 0.005, 3.9, 0.6, 1.3, 1.4],
      56: [1.3, 0.85, 0.45, 0.5, 0.55],
      57: [1.4, 1.4]
    };

    for (int i = 0; i < 58; i++) {
      Edge tmp = new Edge(l[i], d[i]);
      link.add(tmp);
    }
  }

  double haversine(Loc A, Loc B) {
    double R = 6378.137; //Radius of earth in KM
    double bDl = B.latitude * pi / 180;
    double aDl = A.latitude * pi / 180;
    double dLat = bDl - aDl;
    double dLon = B.longtitude * pi / 180 - A.longtitude * pi / 180;

    double sa = sin(dLat / 2);
    double ca = sin(dLon / 2);
    double a = sa * sa + cos(aDl) * cos(bDl) * ca * ca;

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double d = R * c;
    return d;
  }

  double getShortestDistance(
      int now, int goal, List<int> visited, List<int> unVis, List<double> g) {
    List<double> f = [];
    int unvisLn = unVis.length;
    for (int i = 0; i < unvisLn; i++) {
      int tmp = unVis[i];
      double h = haversine(dot[now], dot[tmp]);
      f.add(h + g[i]);
    }

    if (unvisLn <= 1) return 20;
    double minF = f[0];
    int index = 0;
    for (int i = 1; i < unvisLn; i++) {
      if (f[i] < minF) {
        index = i;
        minF = f[i];
      }
    }

    if (unVis[index] != goal) {
      int uvi = unVis[index];
      visited.add(uvi);

      List<int> tmpTo = List.from(link[uvi].to);
      List<double> tmpDis = List.from(link[uvi].distance);
      for (int i = 0; i < tmpTo.length; i++) {
        if (!visited.contains(tmpTo[i])) {
          if (tmpDis[i] + g[index] <= 20) {
            unVis.add(tmpTo[i]);
            g.add(tmpDis[i] + g[index]);
          }
        }
      }

      unVis.removeAt(index);
      g.removeAt(index);

      return getShortestDistance(uvi, goal, visited, unVis, g);
    }

    return g[index];
  }

  List<Pair> getWho(int x) {
    List<Pair> ans = [];
    for (int i = 0; i < dot.length; i++) {
      double hv = haversine(dot[i], dot[x]);
      ans.add(new Pair(i, hv));
    }
    ans.sort((a, b) => a.second.compareTo(b.second));
    return ans;
  }

  List<Pair> getRecommend(int now) {
    List<Pair> who = List.from(getWho(now));
    List<Pair> ans = [];
    for (int i = 0; i < 20; i++) {
      int index = who[i].first;
      if (index != now) {
        List<int> visited = [];
        visited.add(now);
        List<int> to = List.from(link[now].to);
        List<double> dis = List.from(link[now].distance);
        double tmp = getShortestDistance(now, index, visited, to, dis);
        ans.add(new Pair(index, tmp));
      }
    }
    ans.sort((a, b) => a.second.compareTo(b.second));

    return ans;
  }

  List<Loc> getNearestRecommend(int index) {
    List<Loc> ans = [];
    List<Pair> rec = List.from(getRecommend(index));
    for (int i = 0; i < 5; i++) {
      Loc tmp = dot[rec[i].first];
      tmp.disFrom = rec[i].second;
      ans.add(tmp);
    }
    return ans;
  }
}
