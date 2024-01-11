import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<String> userAccounts = [];

  TextEditingController newUsernameController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  void _loadUserAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedAccounts = prefs.getStringList('user_accounts');

    if (savedAccounts != null) {
      setState(() {
        userAccounts = savedAccounts;
      });
    }
  }

  void _addUserAccount(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userAccounts.add(username);
    prefs.setStringList('user_accounts', userAccounts);
    prefs.setString(username, password); // Save the password for the user
    _loadUserAccounts(); // Reload the user accounts after adding a new one
  }

  void _deleteUserAccount(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userAccounts.remove(username);
    prefs.setStringList('user_accounts', userAccounts);
    _loadUserAccounts(); // Reload the user accounts after deleting one
  }

  @override
  void initState() {
    super.initState();
    _loadUserAccounts();
  }

  Future<void> _showAddUserDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Username:'),
              TextField(
                controller: newUsernameController,
                decoration: InputDecoration(hintText: 'Enter username'),
              ),
              SizedBox(height: 10),
              Text('Password:'),
              TextField(
                controller: newPasswordController,
                decoration: InputDecoration(hintText: 'Enter password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String newUsername = newUsernameController.text;
                String newPassword = newPasswordController.text;

                if (newUsername.isNotEmpty && newPassword.isNotEmpty) {
                  _addUserAccount(newUsername, newPassword);
                  newUsernameController.clear();
                  newPasswordController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                newUsernameController.clear();
                newPasswordController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'User Accounts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (userAccounts.isEmpty)
              Text('No user accounts available.')
            else
              Expanded(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Username')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: userAccounts
                      .map(
                        (username) => DataRow(
                      cells: [
                        DataCell(Text(username)),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteUserAccount(username),
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showAddUserDialog,
              child: Text('Add New User'),
            ),
          ],
        ),
      ),
    );
  }
}
