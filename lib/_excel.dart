// import 'dart:io';
// import 'dart:async';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
// import 'package:path_provider/path_provider.dart';

class Loc {
  int index;
  String nama;
  String kategori;
  double rating;
  int harga;
  double latitude;
  double longtitude;
  String alamat;
  double disFrom = 0;

  Loc(int i, String n, String k, double r, int h, double la, double lo,
      String a) {
    this.index = i;
    this.nama = n;
    this.kategori = k;
    this.rating = r;
    this.harga = h;
    this.latitude = la;
    this.longtitude = lo;
    this.alamat = a;
  }
}

class DataConfiguration {
  List<Loc> data;

  void importData() async {
    try {
      print('cokcokcocko');
      ByteData data = await rootBundle.load("assets/existing_excel_file.xlsx");
      var bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table].maxCols);
        print(excel.tables[table].maxRows);
        for (var row in excel.tables[table].rows) {
          print("$row");
        }
      }
      print('cokcokcocko');
    } catch (e) {
      print("Couldn't read file");
      print('cokcokcocko');
    }
  }

  List<Loc> getData() {
    return data;
  }
}
