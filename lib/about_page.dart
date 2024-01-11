import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Aplikasi ini adalah aplilkasi yang dibuat untuk memenuhi tugas besar pemograman mobile milik Raihan Arkantama Gunawan',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
