// ignore_for_file: unnecessary_new

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RincianFakultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rincian Fakultas'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/fpmipa.jpg'),
            ),
            const Text(
              "FPMIPA",
              textAlign: TextAlign.center,
            ),
            const Text(
              "nFakultas Pendidikan Matematika dan Ilmu Pengetahuan Alam",
            ),
          ],
        ));
  }
}
