import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fasilitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('assets/images/gymnasium.jpg'),
                ListTile(
                  // leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Gymnasium UPI'),
                  subtitle: Text(
                    'Fasilitas Olahraga & Gedung Serbaguna',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     'Gedung gymnasium sebagai center atau pusat dari kegiatan kelembagaan seperti penerimaan mahasiswa baru atau wisudaan.Serta gedung Gymnasium biasa digunakan Untuk kepentingan perkuliahan, kegiatan olahraga maupun acara-acara kemahasiswaan.',
                //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('assets/images/poliklinik.jpg'),
                ListTile(
                  // leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Poliklinik UPI'),
                  subtitle: Text(
                    'Fasilitas Kesehatan',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     desc',
                //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
