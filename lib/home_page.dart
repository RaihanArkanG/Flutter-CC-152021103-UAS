import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'Addition/constants.dart';
import 'calculator_page.dart';
import 'bmi_calculator.dart';
import 'info_page.dart'; // Updated import
import 'graph_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  List<String> scheduleDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.25 / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: primaryButtonColor,
      ),
      drawer: SideBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: PageView(
              controller: _pageController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: buttonHeight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                                );
                              },
                              icon: Icon(
                                Icons.calculate,
                                size: 60,
                                color: textColor, // Set icon color to black
                              ),
                              label: Text(
                                'Calculator',
                                style: TextStyle(color: textColor), // Set text color to black
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryButtonColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: buttonHeight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BMICalculatorPage()),
                                );
                              },
                              icon: Icon(
                                Icons.accessibility,
                                size: 60,
                                color: textColor, // Set icon color to black
                              ),
                              label: Text(
                                'BMI Calculator',
                                style: TextStyle(color: textColor), // Set text color to black
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryButtonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: buttonHeight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EarthquakeInfoPage()), // Updated page
                                );
                              },
                              icon: Icon(
                                Icons.error, // Updated icon to error icon for earthquake info
                                size: 60,
                                color: textColor, // Set icon color to black
                              ),
                              label: Text(
                                'Earthquake Info', // Updated label
                                style: TextStyle(color: textColor), // Set text color to black
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryButtonColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: buttonHeight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GraphPage()),
                                );
                              },
                              icon: Icon(
                                Icons.insert_chart,
                                size: 60,
                                color: textColor, // Set icon color to black
                              ),
                              label: Text(
                                'Graph',
                                style: TextStyle(color: textColor), // Set text color to black
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryButtonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      color: secondaryButtonColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              scheduleDays[index],
                              style: TextStyle(color: textColor), // Set text color to black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: secondaryButtonColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Example Class",
                              style: TextStyle(color: textColor), // Set text color to black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
