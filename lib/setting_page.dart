import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Divider(),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                // Navigate to the account settings page
                // You can add the navigation logic here
              },
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Security'),
              onTap: () {
                // Navigate to the security settings page
                // You can add the navigation logic here
              },
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text('Theme'),
              onTap: () {
                // Navigate to the theme settings page
                // You can add the navigation logic here
              },
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Navigate to the notifications settings page
                // You can add the navigation logic here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                // Navigate to the language settings page
                // You can add the navigation logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
