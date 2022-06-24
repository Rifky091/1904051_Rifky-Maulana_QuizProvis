import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

//diambil dari: https://blog.logrocket.com/how-create-flutter-charts-with-charts-flutter/

class ketatfakultas {
  String fakultas; //perlu string
  int ketat;
  charts.Color barColor;
  ketatfakultas(
      {required this.fakultas, required this.ketat, required this.barColor});
}

class ketat {
  List<ketatfakultas> ListPop = <ketatfakultas>[];

  ketat(Map<String, dynamic> json) {
    // isi listPop disini
    var data = json["data"];
    for (var val in data) {
      var fakultas = val["fak"];
      var ketat = val["keketatan"];
      var warna =
          charts.ColorUtil.fromDartColor(Colors.green); //satu warna dulu
      ListPop.add(
          ketatfakultas(fakultas: fakultas, ketat: ketat, barColor: warna));
    }
  }

  //map dari json ke atribut
  factory ketat.fromJson(Map<String, dynamic> json) {
    return ketat(json);
  }
}

class ketatChart extends StatelessWidget {
  List<ketatfakultas> listPop;

  ketatChart({required this.listPop});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ketatfakultas, String>> series = [
      charts.Series(
          id: "ketat",
          data: listPop,
          domainFn: (ketatfakultas series, _) => series.fakultas,
          measureFn: (ketatfakultas series, _) => series.ketat,
          colorFn: (ketatfakultas series, _) => series.barColor)
    ];
    return charts.BarChart(series, animate: true);
  }
}

class ChartDua extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

//class state
class HomePageState extends State<ChartDua> {
  late Future<ketat> futureketat;

  String url = "http://api.rumahcerdas.best:8000/keketatan/upi/2021";

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Keketatan UPI 2021",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ]),
      ),
      body: FutureBuilder<ketat>(
        future: futureketat,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: ketatChart(listPop: snapshot.data!.ListPop));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
