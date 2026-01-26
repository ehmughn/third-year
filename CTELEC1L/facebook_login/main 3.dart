//BASIC NAVIGATION AND ROUTING

// import 'package:flutter/material.dart';  
  
// void main() {  
//   runApp(MaterialApp(  
//     title: 'Flutter Navigation',  
//     theme: ThemeData(  
//       // This is the theme of your application.  
//       primarySwatch: Colors.blue,  
//     ),  
//     home: FirstRoute(),  
//   ));  
// }  
  
// class FirstRoute extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return Scaffold(  
//       appBar: AppBar(  
//         title: Text('First Screen'),  
//       ),  
//       body: Center(  
//         child: ElevatedButton(  
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue[300], // background color
//           ),
//           child: Text('Click here'),  
//           onPressed: () {  
//             Navigator.push(  
//               context,  
//               MaterialPageRoute(builder: (context) => SecondRoute()),  
//             );  
//           },  
//         ),  
//       ),  
//     );  
//   }  
// }  
  
// class SecondRoute extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return Scaffold(  
//       appBar: AppBar(  
//         title: Text("Second Screen"),  
//       ),  
//       body: Center(  
//         child: ElevatedButton(   
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.yellow[300], // background color
//           ), 
//           onPressed: () {  
//             Navigator.pop(context);  
//           },  
//           child: Text('Go back'),  
//         ),  
//       ),  
//     );  
//   }  
// }  

// NAVIGATION WITH NAMED ROUTES

import 'package:flutter/material.dart';  
  
void main() {  
  runApp( MaterialApp(  
    title: 'Named Route Navigation',  
    theme: ThemeData(  
      // This is the theme of your application.  
      primarySwatch: Colors.blue,  
    ),  
    // Start the app with the "/" named route. In this case, the app starts  
    // on the FirstScreen widget.  
    initialRoute: '/',  
    routes: {  
      // When navigating to the "/" route, build the FirstScreen widget.  
      '/': (context) => HomeScreen(),  
      // When navigating to the "/second" route, build the SecondScreen widget.  
      '/second': (context) => SecondScreen(),  
    },  
  ));  
}  
  
class HomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Home Screen'),  
      ),  
      body: Center(  
        child: ElevatedButton(  
          child: Text('Click Here'),  
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[300], // background color
          ),  
          onPressed: () {  
            Navigator.pushNamed(context, '/second');  
          },  
        ),  
      ),  
    );  
  }  
}  
  
class SecondScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text("Second Screen"),  
      ),  
      body: Center(  
        child: ElevatedButton(  
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow[300], // background color
          ),  
          onPressed: () {  
            Navigator.pop(context);  
          },  
          child: Text('Go back!'),  
        ),  
      ),  
    );  
  }  
}  

// // NAVIGATION AND ROUTING WITH MULTIPLE PAGE

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Navigation Example - Multiple Pages',
//       theme: ThemeData(  
//         // This is the theme of your application.  
//         primarySwatch: Colors.blue,  
//       ),
//       initialRoute: '/',  // Initial route
//       routes: {
//         '/': (context) => HomePage(),
//         '/second': (context) => SecondPage(),
//         '/third': (context) => ThirdPage(),
//       },
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Page')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/second'); // Navigate to SecondPage
//           },
//           child: Text('Go to Second Page'),
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second Page')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/third'); // Navigate to ThirdPage
//           },
//           child: Text('Go to Third Page'),
//         ),
//       ),
//     );
//   }
// }

// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Third Page')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.popUntil(context, ModalRoute.withName('/')); // Go back to HomePage
//           },
//           child: Text('Go Back to Home Page'),
//         ),
//       ),
//     );
//   }
// }
