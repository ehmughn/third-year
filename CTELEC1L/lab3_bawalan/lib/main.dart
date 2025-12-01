import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All About Me!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _iconText = "^ Click on the image above ^";

  void _changeIconText(String iconText) {
    setState(() {
      _iconText = iconText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All About Me!"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/waving-hand.png',
                  width: 150,
                  height: 150,
                ),
                const Text(
                  "I'm Emmanuel T. Bawalan",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text("IT Student", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _changeIconText('I go to National University Dasmarinas!'),
                      icon: Icon(Icons.school), 
                    ),
                    SizedBox(width: 30),

                    Icon(Icons.code),
                   SizedBox(width: 30),

                    IconButton(
                      onPressed: () => _changeIconText('I enjoy gaming!'),
                      icon: Icon(Icons.gamepad),
                    ),
                  ],
                ),
                Text(_iconText),
                const SizedBox(height: 60),

                const Text(
                  'I\'m currently studying Information Technology Student at NU Dasmariñas, aspiring to be a Full-Stack Developer, and maybe become a Game Developer if creativity isn\'t a limiting factor. I love playing video games and because of that, I learned programming through Minecraft (starting on minecraft redstone, then command blocks, then datapacks which is an indirect solution for Mojang to support mods for Minecraft Java, and then I have to learn C++ [no particular reason why that language though] to help me automate the creation of said datapacks). It served as a massive headstart in college, especially when dealing with programming challenges. Now, I am mastering my skills on graphic designs, and hopefully one day I can be confident at my artistic creations.',
                ),

                TextButton(
                  onPressed: () => _changeIconText('https://github.com/ehmughn'),
                  child: const Text("Show link on GitHub"),
                ),

                // Elevated Button
                ElevatedButton(
                  onPressed: () => _changeIconText('https://facebook.com/ehmughn'),
                  child: const Text("Show link on Facebook"),
                ),

                const SizedBox(height: 30),
                const Text("You are you, not a clone of your parents.", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
