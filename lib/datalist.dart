import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ketatTahun {
  int ketat;
  String fakultas;
  ketatTahun({required this.ketat, required this.fakultas});
}

class ketat {
  List<ketatTahun> ListPop = <ketatTahun>[];

  ketat(Map<String, dynamic> json) {
    // isi listPop disini
    var data = json["data"];
    for (var val in data) {
      var fakultas = val["fak"];
      var ketat = val["keketatan"];

      ListPop.add(ketatTahun(fakultas: fakultas, ketat: ketat));
    }
  }

  //map dari json ke atribut
  factory ketat.fromJson(Map<String, dynamic> json) {
    return ketat(json);
  }
}

class DataLIst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<DataLIst> {
  late Future<ketat> futureketat;

  //https://datausa.io/api/data?drilldowns=Nation&measures=keketatan
  String url = "http://api.rumahcerdas.best:8000/keketatan/upi/2020";

  //fetch data
  Future<ketat> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return ketat.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureketat = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: FutureBuilder<ketat>(
          future: futureketat,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                //gunakan listview builder
                child: ListView.builder(
                  itemCount:
                      snapshot.data!.ListPop.length, //asumsikan data ada isi
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        padding: const EdgeInsets.all(14),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.ListPop[index].ketat
                                  .toString()),
                              Text(snapshot.data!.ListPop[index].fakultas
                                  .toString()),
                              Text(snapshot.data!.ListPop[index].ketat
                                  .toString()),
                            ]));
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    ));
  }
}
