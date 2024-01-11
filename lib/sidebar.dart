import 'package:flutter/material.dart';
import 'package:pemograman_mobile/about_page.dart';
import 'Addition/constants.dart';
import 'calculator_page.dart';
import 'bmi_calculator.dart';
import 'Info_page.dart';
import 'setting_page.dart';
import 'biodata_page.dart';
import 'login_page.dart';
import 'graph_page.dart';


class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryButtonColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.jpeg"),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'raihan', // Display user name
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
                Expanded(
                  child: Text(
                    'email@example.com', // Display user email
                    style: whiteTextStyle.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          buildListTile(Icons.calculate, 'Calculator', CalculatorPage(), context),
          buildListTile(Icons.accessibility, 'BMI Calculator', BMICalculatorPage(), context),
          buildListTile(Icons.insert_chart, 'Graph', GraphPage(), context),
          buildListTile(Icons.info, 'Earthquake Info', EarthquakeInfoPage(), context),
          buildListTile(Icons.person, 'Biodata', BiodataPage(), context),
          buildListTile(Icons.settings, 'Settings', SettingsPage(), context),
          buildListTile(Icons.info, 'About', AboutPage(), context),
          Divider(), // Add a divider to separate items
          buildLogoutTile(Icons.logout, 'Logout', context),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, Widget page, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: secondaryTextColor),
      title: Text(title, style: textTextStyle),
      onTap: () {
        if (page is Widget) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
        }
      },
    );
  }

  ListTile buildLogoutTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: secondaryTextColor),
      title: Text(title, style: textTextStyle),
      onTap: () {
        showLogoutConfirmation(context);
      },
    );
  }

  Future<void> showLogoutConfirmation(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout logic here
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
