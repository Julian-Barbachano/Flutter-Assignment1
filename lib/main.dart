import 'package:flutter/material.dart';
import 'dart:math';

const kPrimaryColor = Color(0xFF147CD3);
const kSecondaryColor = Color(0xFF2196F3);
const kNumberTextStyle = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  foregroundColor: Colors.white,
  minimumSize: const Size(double.infinity, 60),

  textStyle: const TextStyle(fontSize: 18),

  shape: const BeveledRectangleBorder(
    borderRadius: BorderRadius.zero,
  ),
);
//This is a global variable that can be applied to both Home Page and Statistics Page

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
      title: 'Home Page',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Random Number Generator'),
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

  //Elevated Button Theme template
  final ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white, 
    minimumSize: const Size(double.infinity, 60),
    textStyle: const TextStyle(fontSize: 18),
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.zero
    ) 
  );
  //Made a local variable for the button theme, only covers this page

  Map<int, int> stats = {
    for (int i = 1; i <= 9; i++) i:0
  };
  //Map variable made with assistance from GPT

  void generateNumber() {
    setState(() {
      randomNumber = _random.nextInt(9) + 1;

      stats[randomNumber!] = (stats[randomNumber!] ?? 0)+ 1; //Will update the map and display number of times a number was generated
    });
  }

  int? randomNumber;
  final Random _random = Random(); //Random number generator setup assisted by ChatGPT

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kSecondaryColor, 
      appBar: AppBar(
   
        backgroundColor: kPrimaryColor,

        leading: IconButton(
          icon: const Icon(Icons.home),
          color: Colors.white,
          onPressed: null,
        ), //Used a button instead of a Icon. Button appears grey since null
  
        title: Text(widget.title),
      ),

      body: SafeArea(
      child: Center(
        child: Text(
          randomNumber == null ? "" : randomNumber.toString(), //Ternary Operator used to show nothing on startup/reset of program and prevent crash
          //Assisted with ChatGPT

          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

      ),
    ),

      bottomNavigationBar: SafeArea(

       child: Padding(
        padding: EdgeInsets.all(16),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton( //Generate a number button
               style: _elevatedButtonStyle,
              onPressed: generateNumber,
              child: Text("Generate")
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton( //View statistics button
                style: _elevatedButtonStyle,
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsPage(stats: stats)));
              }, 
              child: Text("View Statistics"),
              ),
            )
          ],
        ),

      ),
    ),

    );
  }
}

class StatisticsPage extends StatelessWidget {
   
  final Map<int, int> stats;

  const StatisticsPage({super.key, required this.stats});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Statistics")),
      
      body: SafeArea(
      child: ListView(
        children: stats.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Number ${entry.key}",
                  style: const TextStyle(fontSize: 20),
                ),

                Text(
                  "${entry.value} times",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
              ),
          );
        }).toList(),
      ),
    ),

    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: elevatedButtonStyle,
                onPressed: null, 
                child: Text("Reset") ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: elevatedButtonStyle,
                onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text("Back to Home"),
              ),
            )
          ],
        )
      )
    ),
    );
  }
}
