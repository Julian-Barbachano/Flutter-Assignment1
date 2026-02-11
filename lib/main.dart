import 'package:flutter/material.dart';
import 'dart:math';

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
    backgroundColor: Color(0xFF147CD3),
    foregroundColor: Colors.white, 
    minimumSize: const Size(double.infinity, 60),
    textStyle: const TextStyle(fontSize: 18),
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.zero
    ) 
  );


  int? randomNumber;
  final Random _random = Random(); //Random number generator setup assisted by ChatGPT

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2196F3),
      appBar: AppBar(
   
        backgroundColor: Color(0xFF147CD3),

        leading: IconButton(
          icon: const Icon(Icons.home),
          color: Colors.white,
          onPressed: null,
        ),
  
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
              child: ElevatedButton(
               style: _elevatedButtonStyle,
              onPressed: () {
                setState(() {
                  randomNumber = _random.nextInt(9) + 1; //Format taken from Flutter Mentor on Youtube
                });
              },

              child: Text("Generate")
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: _elevatedButtonStyle,
                onPressed: () {
                Navigator.pushNamed(context, '/stats');
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
