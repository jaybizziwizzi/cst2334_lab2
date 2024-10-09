import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

import 'profile_page.dart';
import 'repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        '/ProfilePage': (context) => const ProfilePage(title: '',),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  void loadData() {}
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _login;
  late TextEditingController _password;
  var imageSource = "images/question-mark.png";

  @override
  void initState() {
    super.initState();
    _login = TextEditingController();
    _password = TextEditingController();
    _loadData();
  }

  Future<void> _loadData() async {
    await Repository.loadData();
    final result = EncryptedSharedPreferences();

    setState(() {
      _login.text = Repository.loginName;
      _password.text = Repository.password;
      if (_login.text.isNotEmpty || _password.text.isNotEmpty) {
        var snackBar = SnackBar(content: const Text('Data auto filled!'),
          action: SnackBarAction(label: 'Undo', onPressed: clearText),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
      }

  void clearText() {
    _login.text = "";
    _password.text = "";
  }

  Future<void> saveData() async {
    await Repository.saveData();
  }

  void _toProfilePage() {
    Navigator.pushNamed(context, "/ProfilePage");
  }

  @override
  void dispose() async {
    _login.dispose();
    _password.dispose();
    await Repository.loadData();
    await Repository.saveData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _login,
              decoration: const InputDecoration(
                hintText: "Login",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_password.text == 'QWERTY123') {
                    imageSource = "images/idea.png";
                    Repository.loginName = _login.text;
                    Repository.password = _password.text;
                    Repository.saveData();
                   _toProfilePage();
                  } else {
                    imageSource = "images/stop.png";
                  }
                });
              },
              child: const Text("Login"),
            ),
            Image.asset(imageSource, width: 300, height: 300),
          ],
        ),
      ),
    );
  }
}
