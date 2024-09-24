import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  var isChecked = false;
  late TextEditingController _login;
  late TextEditingController _password;
  var imageSource = "images/question-mark.png";

  @override
  void initState() {
    super.initState();
    _login = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  void checkPassword() {
    String password = _password.value.text;
    setState(() {
      if(password == "QWERTY123") {
        imageSource = "images/idea.png";
      } else {
        imageSource = "images/stop.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          OutlinedButton(onPressed: (){ }, child: const Text("Button 1")),
          OutlinedButton(onPressed: (){ }, child: const Text("Button 1")),
        ],
      ),
      drawer:const Drawer(child: Text("Hi there!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _login,
                decoration: const InputDecoration(hintText: "Login",
                border: OutlineInputBorder()
                ),
            ),
            TextField(controller: _password,
              decoration: const InputDecoration(hintText: "Password",
                  border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            ElevatedButton(onPressed: checkPassword, child: const Text("Login"),),
            Image.asset(imageSource, width: 300, height: 300),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem( icon: Icon(Icons.camera), label: 'Camera' ),
          BottomNavigationBarItem( icon: Icon(Icons.add_call), label: 'Phone'  ),
        ],
          onTap: (buttonIndex) {  } ,
        )// This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
