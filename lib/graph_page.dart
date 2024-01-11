import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pemograman_mobile/Addition/constants.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<FlSpot> dataPoints1 = [];
  bool showGraph = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Page'),
        backgroundColor: primaryButtonColor, // Set the app bar color to primary button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Graph for Set 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (showGraph) // Only show the graph when showGraph is true
              AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    minX: 0,
                    maxX: dataPoints1.length.toDouble(),
                    minY: 0,
                    maxY: 10,
                    lineBarsData: [
                      LineChartBarData(
                        spots: dataPoints1,
                        isCurved: true,
                        colors: [Colors.blue],
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter data for Set 1',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                setState(() {
                  double number = double.tryParse(value) ?? 0.0;
                  dataPoints1.add(FlSpot(dataPoints1.length.toDouble(), number));
                  showGraph = true; // Show the graph when data points are added
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
