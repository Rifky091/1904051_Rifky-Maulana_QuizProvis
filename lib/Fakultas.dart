import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'RincianFakultas.dart';

class Fakultas extends StatelessWidget {
  const Fakultas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(padding: EdgeInsets.all(20), shrinkWrap: true, children: [
        InkWell(
          child: ListTile(
            // leading: Icon(Icons.arrow_drop_down_circle),
            trailing: Image.asset('assets/images/Kucing.jpg'),
            title: const Text(
              'FPMIPA',
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              'Fakultas Pendidikan Matematika dan Ilmu Pengetahuan Alam',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RincianFakultas();
            }));
            //gunakan navigator untuk panggil RincianFakultas
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  // leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text(
                    'FPIPS',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'Fakultas Pendidikan Ilmu Pengetahuan Sosial',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  trailing: Image.asset(
                    'assets/images/Kucing.jpg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
