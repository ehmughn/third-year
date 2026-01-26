import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Arial',
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
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  // Controllers for all fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _motherFirstNameController = TextEditingController();
  final TextEditingController _motherMiddleNameController = TextEditingController();
  final TextEditingController _motherLastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _selectedGender;
  String? _selectedCivilStatus;
  bool _acceptedTerms = false;

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _civilStatus = ['Single', 'Married', 'Separated', 'Widow', 'Divorced', 'Annuled', 'Widower', 'Single Parent'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A0A0A),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              color: Color(0xFF3A0A0A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'REGISTER AS FIRST TIME JOBSEEKER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontFamily: 'Arial',
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedGender,
                          decoration: InputDecoration(
                            labelText: 'Select Gender',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          items: _genders
                              .map((gender) => DropdownMenuItem(
                                    value: gender,
                                    child: Text(
                                      gender,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Please select a gender' : null,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                          dropdownColor: Color(0xFF191919),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedCivilStatus,
                          decoration: InputDecoration(
                            labelText: 'Civil Status',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          items: _civilStatus
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCivilStatus = value;
                            });
                          },
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Please select civil status' : null,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                          dropdownColor: Color(0xFF191919),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Birth Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: ColorScheme.dark(
                                primary: Colors.orange,
                                surface: Color(0xFF191919),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1.5),
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFF191919),
                      ),
                      child: Text(
                        _selectedDate == null
                            ? '- Select Birth Date -'
                            : '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                  if (_birthDateError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4),
                      child: Text(
                        _birthDateError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? 'First name is required' : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _middleNameController,
                    decoration: InputDecoration(
                      labelText: 'Middle Name',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      hintText: 'Middle Name',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? 'Middle name is required' : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      labelText: 'Surname',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      hintText: 'Surname',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? 'Surname is required' : null,
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Mother's Maiden Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _motherFirstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                          validator: (value) => value == null || value.trim().isEmpty
                              ? 'Required'
                              : null,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: _motherMiddleNameController,
                          decoration: InputDecoration(
                            labelText: 'Middle Name',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            hintText: 'Middle Name',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                          validator: (value) => value == null || value.trim().isEmpty
                              ? 'Required'
                              : null,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: _motherLastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                          validator: (value) => value == null || value.trim().isEmpty
                              ? 'Required'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number (09XXXXXXXXX)',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      hintText: 'Mobile Number (09XXXXXXXXX)',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Mobile number is required';
                      }
                      if (!RegExp(r'^09\d{9}$').hasMatch(value.trim())) {
                        return 'Enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter new Email Address',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      hintText: 'Enter new Email Address',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Color(0xFF191919),
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Enter new Password',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            hintText: 'Enter new Password',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 8) {
                              return 'Min 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm new Password',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            hintText: 'Confirm new Password',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.orange, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.red, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            fillColor: Color(0xFF191919),
                            filled: true,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptedTerms,
                        onChanged: (val) {
                          setState(() {
                            _acceptedTerms = val ?? false;
                          });
                        },
                        activeColor: Colors.orange,
                        checkColor: Colors.white,
                        side: BorderSide(color: Colors.orange, width: 1.5),
                      ),
                      Text(
                        'READ and ACCEPT ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Arial',
                        ),
                      ),
                      Text(
                        'TERMS OF SERVICES',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Arial',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  if (_termsError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4),
                      child: Text(
                        _termsError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(
                          color: Colors.orange,
                          width: 1.5,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _birthDateError = null;
                          _termsError = null;
                        });
                        bool valid = _formKey.currentState?.validate() ?? false;
                        if (_selectedDate == null) {
                          setState(() {
                            _birthDateError = 'Birth date is required';
                          });
                          valid = false;
                        }
                        if (!_acceptedTerms) {
                          setState(() {
                            _termsError = 'You must accept the terms';
                          });
                          valid = false;
                        }
                        if (valid) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Form Submitted'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Gender: ${_selectedGender ?? ""}'),
                                    Text('Civil Status: ${_selectedCivilStatus ?? ""}'),
                                    Text('Birth Date: ${_selectedDate != null ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}" : ""}'),
                                    Text('First Name: ${_firstNameController.text}'),
                                    Text('Middle Name: ${_middleNameController.text}'),
                                    Text('Surname: ${_surnameController.text}'),
                                    Text("Mother's Maiden Name: ${_motherFirstNameController.text} ${_motherMiddleNameController.text} ${_motherLastNameController.text}"),
                                    Text('Mobile Number: ${_mobileController.text}'),
                                    Text('Email: ${_emailController.text}'),
                                    Text('Password: ${_passwordController.text}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                          color: Colors.orange,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _birthDateError;
  String? _termsError;
}
