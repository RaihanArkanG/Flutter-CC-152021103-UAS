import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pemograman_mobile/Addition/constants.dart';

class EarthquakeInfoPage extends StatefulWidget {
  @override
  _EarthquakeInfoPageState createState() => _EarthquakeInfoPageState();
}

class Earthquake {
  final String date;
  final String time;
  final String coordinates;
  final double magnitude;
  final String depth;
  final String region;
  final String potentialTsunami;

  Earthquake({
    required this.date,
    required this.time,
    required this.coordinates,
    required this.magnitude,
    required this.depth,
    required this.region,
    required this.potentialTsunami,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      date: json['Tanggal'],
      time: json['Jam'],
      coordinates: json['Coordinates'],
      magnitude: double.parse(json['Magnitude']),
      depth: json['Kedalaman'],
      region: json['Wilayah'],
      potentialTsunami: json['Potensi'],
    );
  }
}

class EarthquakeInfoService {
  final String apiUrl = 'https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json';

  Future<List<Earthquake>> getEarthquakeInfo() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> earthquakes = data['Infogempa']['gempa'];
      return earthquakes.map((json) => Earthquake.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load earthquake information');
    }
  }
}

class _EarthquakeInfoPageState extends State<EarthquakeInfoPage> {
  late Future<List<Earthquake>> _futureEarthquakes;

  @override
  void initState() {
    super.initState();
    _futureEarthquakes = _fetchEarthquakeInfo();
  }

  Future<List<Earthquake>> _fetchEarthquakeInfo() async {
    try {
      final EarthquakeInfoService earthquakeInfoService = EarthquakeInfoService();
      return await earthquakeInfoService.getEarthquakeInfo();
    } catch (error) {
      print('Error fetching earthquake information: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            color: textColor, // Change to textColor
          ),
          title: Text(
            'Earthquake Information',
            style: TextStyle(color: textColor), // Change to textColor
          ),
          backgroundColor: primaryButtonColor,
        ),
        body: FutureBuilder(
          future: _futureEarthquakes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Earthquake>? earthquakes = snapshot.data as List<Earthquake>?;
              return ListView.builder(
                itemCount: earthquakes!.length,
                itemBuilder: (context, index) {
                  final earthquake = earthquakes[index];
                  return ListTile(
                    title: Text('${earthquake.date} ${earthquake.time}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Magnitude: ${earthquake.magnitude}'),
                        Text('Depth: ${earthquake.depth}'),
                        Text('Region: ${earthquake.region}'),
                        Text('Potential Tsunami: ${earthquake.potentialTsunami}'),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
