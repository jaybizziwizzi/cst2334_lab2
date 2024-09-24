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
  double _fontSize = 30.0;
  double _contentFontSize = 18.0;
  double _stackCaptionFontSize = 20.0;
  double _categoricalFontSize = 26.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
          padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            // BROWSE CATEGORIES - ITEM #1
              Container(
                  child: Text(
                "BROWSE CATEGORIES",
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ),
              // BIG TEXT - ITEM #2
              Align(alignment: Alignment.centerLeft,
                child: Container(child: Text("Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories.",
                style: TextStyle(
                  fontSize: _contentFontSize,
                ),
                ),
                ),
              ),
              // BY MEAT - ITEM #3
              Container(child: Text("BY MEAT",
              style: TextStyle(
                fontSize: _categoricalFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
              ),
              // ROW OF MEAT ITEMS - ITEM #4
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // BEEF
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/beef.jpg'),
                          radius: 80
                      ),
                      Text(
                        "BEEF",
                        style: TextStyle(
                          fontSize: _fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // CHICKEN
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/chicken.jpg'),
                          radius: 80
                      ),
                      Text(
                        "CHICKEN",
                        style: TextStyle(
                          fontSize: _fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // PORK
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/pork.jpg'),
                          radius: 80
                      ),
                      Text(
                        "PORK",
                        style: TextStyle(
                          fontSize: _fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // SEAFOOD
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/seafood.jpg'),
                          radius: 80
                      ),
                      Text(
                        "SEAFOOD",
                        style: TextStyle(
                          fontSize: _fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // BY COURSE - ITEM #5
              Container(child: Text("BY COURSE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: _categoricalFontSize,
              ),
              ),
              ),
              // ROW OF COURSE ITEMS - ITEM #6
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // BEEF
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/main_dishes.jpg'),
                          radius: 80
                      ),
                      Align(alignment: Alignment.bottomCenter,
                      child: Text(
                        "Main Dishes",
                        style: TextStyle(
                          fontSize: _stackCaptionFontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                    ],
                  ),
                  // SALAD
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/salad.jpg'),
                          radius: 80
                      ),
                      Text(
                        "Salad Recipes",
                        style: TextStyle(
                          fontSize: _stackCaptionFontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // SIDE DISHES
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/side_dishes.jpg'),
                          radius: 80
                      ),
                      Text(
                        "Side Dishes",
                        style: TextStyle(
                          fontSize: _stackCaptionFontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // CROCKPOT
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('images/pot.jpg'),
                          radius: 80
                      ),
                      Text(
                        "Crockpot",
                        style: TextStyle(
                          fontSize: _stackCaptionFontSize,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                Container(child: Text("BY DESSERT",
                style: TextStyle(
                  fontSize: _categoricalFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // ICE CREAM
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage('images/ice_cream.jpg'),
                            radius: 80
                        ),
                        Align(alignment: Alignment.bottomCenter,
                          child: Text(
                            "Ice Cream",
                            style: TextStyle(
                              fontSize: _stackCaptionFontSize,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // BROWNIES
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage('images/brownies.jpg'),
                            radius: 80
                        ),
                        Text(
                          "Brownies",
                          style: TextStyle(
                            fontSize: _stackCaptionFontSize,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // PIES
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage('images/pies.jpg'),
                            radius: 80
                        ),
                        Text(
                          "Pies",
                          style: TextStyle(
                            fontSize: _stackCaptionFontSize,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // COOKIES
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage('images/cookies.jpg'),
                            radius: 80
                        ),
                        Text(
                          "Cookies",
                          style: TextStyle(
                            fontSize: _stackCaptionFontSize,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
