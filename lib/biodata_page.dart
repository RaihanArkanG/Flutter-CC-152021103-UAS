import 'package:flutter/material.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Align the text to the center
          children: [
            SizedBox(
              height: 20,
            ),
            // Placeholder for an image
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/bio.jpg'), // Replace with the actual image path
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Data Mahasiswa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Nama: Raihan Arkantama Gunawan'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Nrp: 152021103'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Umur: 20'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Telp: 081908813883'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email: raihan.arkantama@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}
