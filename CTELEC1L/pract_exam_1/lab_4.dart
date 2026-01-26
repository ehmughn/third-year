import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Layout Widgets - Emmanuel T. Bawalan'),
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


    // Lists for easy shit
    final List<String> navigationButtons = ["NU Quest", "NUIS", "NU Bills"];
    final List<IconData> iconsBelow = [Icons.home, Icons.search, Icons.settings];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            // Dashboard and notification icon part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),

            SizedBox(height: 20),

            // NU Quest, NUIS, NU Bills part
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: List.generate(3, (index) {
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text(
                    navigationButtons[index],
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            // NU HEADER
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/national-university-ph.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 5,
                  child: Text(
                    "National University",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                )
              ],
            ),
            

            SizedBox(height: 20),

            // Cards
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue[(index + 1) * 100],
                  child: Center(
                    child: Text(
                      'Card ${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            // Home, Search, and Settings part
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 40,
              children: List.generate(3, (index) {
                return Icon(iconsBelow[index]);
              }),
            ),

          ],
        ),
      ),
    );
  }
}
