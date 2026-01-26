import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Registration',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens for Bottom Navigation Bar
  final List<Widget> _screens = [RegistrationScreen(), ListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      // Drawer for navigation
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Student Registration',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Registration'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('List'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // Display the current screen
      body: _screens[_currentIndex],
      // Bottom Navigation Bar for navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting, // Shifting
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Registration',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'List',
            // backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _studentNumberController = TextEditingController();
  final _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCourse;
  final _emailController = TextEditingController();
  final _cpNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> _courseList = ['BSIT', 'BSCS'];

  bool _isLoading = false;

  Future<void> registerStudent() async {
    setState(() {
      _isLoading = true;
    });
    // use 10.0.2.2 instead of localhost for working on Android Emulator!!!
    // use localhost or 127.0.0.1 for working on Web Browsers!!!
    final url =
        'http://localhost/flutter-student-registration/registration.php'; // Update with your PHP URL
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'student_number': _studentNumberController.text,
          'name': _nameController.text,
          'birthday': _selectedDate.toString(),
          'course': _selectedCourse,
          'email': _emailController.text,
          'cp_number': _cpNumberController.text,
          'password': _passwordController.text,
        },
      );

      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        // Show success message
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Registration Successful'),
            content: Text(data['message']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        );
      } else {
        // Show error message
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text(data['message']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle network errors
      print(error);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text(
            'Failed to connect to the server. Please try again later.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Validation Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24),
            TextField(
              controller: _studentNumberController,
              cursorColor: Color(0xFF1568F6),
              decoration: InputDecoration(
                labelText: 'Student Number',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nameController,
              cursorColor: Color(0xFF1568F6),
              decoration: InputDecoration(
                labelText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Birthday'
                          : '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}',
                      style: TextStyle(
                        color: _selectedDate == null
                            ? Colors.grey[800]
                            : Colors.black,
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey[800]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedCourse,
              items: _courseList
                  .map(
                    (status) =>
                        DropdownMenuItem(value: status, child: Text(status)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCourse = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Course',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _emailController,
              cursorColor: Color(0xFF1568F6),
              decoration: InputDecoration(
                labelText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _cpNumberController,
              cursorColor: Color(0xFF1568F6),
              decoration: InputDecoration(
                labelText: 'CP Number',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              cursorColor: Color(0xFF1568F6),
              decoration: InputDecoration(
                labelText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCD0D5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1568F6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF48BA2F),
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_studentNumberController.text.isEmpty) {
                        _showErrorDialog('Student Number is required');
                        return;
                      }
                      if (_nameController.text.isEmpty) {
                        _showErrorDialog('Name is required');
                        return;
                      }
                      if (_selectedDate == null) {
                        _showErrorDialog('Birthday is required');
                        return;
                      }
                      if (_selectedCourse == null) {
                        _showErrorDialog('Course is required');
                        return;
                      }
                      if (_emailController.text.isEmpty) {
                        _showErrorDialog('Email is required');
                        return;
                      }
                      if (!RegExp(
                        r'^[^@]+@[^@]+\.[^@]+',
                      ).hasMatch(_emailController.text.trim())) {
                        _showErrorDialog('Enter a valid email address');
                        return;
                      }
                      if (_cpNumberController.text.isEmpty) {
                        _showErrorDialog('CP Number is required');
                        return;
                      }
                      if (!RegExp(
                        r'^09\d{9}$',
                      ).hasMatch(_cpNumberController.text.trim())) {
                        _showErrorDialog('Enter a valid CP number');
                        return;
                      }
                      if (_cpNumberController.text.length != 11) {
                        _showErrorDialog('CP number must be 11 digits');
                        return;
                      }
                      if (_passwordController.text.isEmpty) {
                        _showErrorDialog('Password is required');
                        return;
                      }
                      if (_passwordController.text.length < 8) {
                        _showErrorDialog('Password must be at least 8 characters');
                        return;
                      }

                      // All validations passed
                      registerStudent();
                    },
                    child: Text('Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ApiService apiService = ApiService();

  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  loadStudents() async {
    students = await apiService.getStudents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                var student = students[index];
                return ListTile(
                  title: Text(student['name']),
                  subtitle: Text(student['course'])
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ApiService {
  // use 10.0.2.2 instead of localhost for working on Android Emulator!!!
  // use localhost or 127.0.0.1 for working on Web Browsers!!!
  final String baseUrl = "http://localhost/flutter-student-registration/getstudents.php"; // Update with your PHP file URL

  // Read
  Future<List<Map<String, dynamic>>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> courses = [];
      List<dynamic> data = jsonDecode(response.body);
      for (var course in data) {
        courses.add(course as Map<String, dynamic>);
      }
      return courses;
    } else {
      throw Exception('Failed to load students');
    }
  }
}
