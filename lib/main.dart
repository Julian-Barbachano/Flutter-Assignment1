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
      title: 'Home Page',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          foregroundColor: Colors.white,
        )
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
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2196F3),
      appBar: AppBar(
   
        backgroundColor: Color(0xFF147CD3),

        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
  
        title: Text(widget.title),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF147CD3),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
               ),
              onPressed: () {},

              child: Text("Generate")
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF147CD3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                
                
                onPressed: () {
                Navigator.pushNamed(context, '/stats');
              }, 
              child: Text("View Statistics"),
              ),
            )
          ],
        ),

      ),
      
    );
  }
}
