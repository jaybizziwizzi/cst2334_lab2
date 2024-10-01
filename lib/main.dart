import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    SharedPreferences.getInstance().then((result){
      var login = result.getString('Login');
      var password = result.getString('Password');
      if (login != null && password != null) {
        _login.text = login;
        _password.text = password;
        var snackBar = SnackBar(content: Text('Data autofilled!'),
          action: SnackBarAction(label: 'Undo', onPressed: clearText),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void clearText() {
    _login.text = "";
    _password.text = "";
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance().then((result){
      result.setString('Login', _login.text);
      result.setString('Password', _password.text);
    });

  }

  Future<void> _popUpBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Data?'),
          content: const Text('Save username and password for future logins?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () async {
                await saveData(); // Save data when "Yes" is pressed
                Navigator.of(context).pop();
              },
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
                _popUpBuilder(context); // Show the dialog
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
