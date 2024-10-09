import 'package:cst2334_lab2/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'repository.dart'; // Import your repository

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();

  // Future<void> _popUpBuilder(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Save Data?'),
  //         content: const Text('Save username and password for future logins?'),
  //         actions: <Widget>[
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('No'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Yes'),
  //             onPressed: () async {
  //               await saveData(); // Save data when "Yes" is pressed
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Repository.loadData();

    setState(() {
      _fName.text = Repository.fName;
      _lName.text = Repository.lName;
      _phoneNumber.text = Repository.phoneNumber;
      _email.text = Repository.email;
      
      String loginName = Repository.loginName;
      _showSnackBar('Welcome Back, $loginName');
    });
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _saveData() async {
    Repository.fName = _fName.text;
    Repository.lName = _lName.text;
    Repository.phoneNumber = _phoneNumber.text;
    Repository.email = _email.text;

    await Repository.saveData();
  }

  @override
  void dispose() {
    Repository.saveData();
    _fName.dispose();
    _lName.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    super.dispose();
  }

  void _launchDialer() async {
    final Uri launchUri = Uri(scheme: 'tel', path: _phoneNumber.text);
    if (await canLaunchUrl(launchUri)) {
      launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  void _launchSMS() async {
    final Uri launchUri = Uri(scheme: 'sms', path: _phoneNumber.text);
    if (await canLaunchUrl(launchUri)) {
      launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  void _launchEmail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: _email.text,
    );
    if (await canLaunchUrl(launchUri)) {
      launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _fName,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _saveData(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _lName,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _saveData(),
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _phoneNumber,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => _saveData(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _launchDialer,
                  child: const Icon(Icons.phone),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _launchSMS,
                  child: const Icon(Icons.sms),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => _saveData(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _launchEmail,
                  child: const Icon(Icons.mail),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}