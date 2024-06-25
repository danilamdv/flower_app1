import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/body_widgets/profile_page/profile_page.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FillProfileScreen extends StatefulWidget {
  @override
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  String _countryCode = '+1';
  String _gender = 'Male';
  bool _isSocialSignIn = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

    // Giriş yöntemlerini kontrol et
    List<String> signInMethods = await user!.providerData
        .map((userInfo) => userInfo.providerId)
        .toList();

    _isSocialSignIn = signInMethods.contains('facebook.com') ||
        signInMethods.contains('google.com') ||
        signInMethods.contains('twitter.com');

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('profiles').doc(uid).get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data();
      _nameController.text = data?['name'] ?? '';
      _surnameController.text = data?['surname'] ?? '';
      _dobController.text = data?['dob'] ?? '';
      _emailController.text = data?['email'] ?? '';
      _phoneController.text = data?['phone'] ?? '';
      _countryCode = data?['countryCode'] ?? '+1';
      _gender = data?['gender'] ?? 'Male';

      String profileImagePath = data?['profileImage'] ?? '';
      if (profileImagePath.isNotEmpty) {
        setState(() {
          _profileImage = File(profileImagePath);
        });
      }
    }

    if (_isSocialSignIn) {
      setState(() {
        _emailController.text = user.email ?? "";
      });
    }
    if (!_isSocialSignIn) {
      if (signInMethods.contains('password')) {
        setState(() {
          _emailController.text = user.email ?? "";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Fill Your Profile",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? Icon(Icons.camera_alt, size: 40.r)
                            : null,
                      ),
                      Positioned(
                        right: 2.w,
                        bottom: 5.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0.r),
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Colors.white,
                              size: 17.r,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                _buildTextField(_nameController, 'Name', screenWidth),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                _buildTextField(_surnameController, 'Surname', screenWidth),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                _buildDateField(_dobController, 'Date of Birth', screenWidth),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                if (!_isSocialSignIn)
                  _buildTextField(_emailController, 'Email', screenWidth),
                if (!_isSocialSignIn) SizedBox(height: 20.0.h),
                _buildPhoneField(_phoneController, 'Phone Number', screenWidth),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                _buildDropdownField('Gender', screenWidth),
                if (_isSocialSignIn)
                  SizedBox(height: 30.0.h)
                else
                  SizedBox(height: 20.0.h),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, double screenWidth,
      {bool readOnly = false}) {
    return Container(
      height: 45.h,
      child: TextField(
        style: TextStyle(fontSize: 10.sp),
        cursorHeight: 0,
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: label,
            labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 240, 240, 240)),
      ),
    );
  }

  Widget _buildDateField(
      TextEditingController controller, String label, double screenWidth) {
    return Container(
      height: 45.h,
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            setState(() {
              controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
            });
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: label,
            labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 240, 240, 240)),
      ),
    );
  }

  Widget _buildPhoneField(
      TextEditingController controller, String label, double screenWidth) {
    return Container(
      height: 45.h,
      child: Row(
        children: [
          Container(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              value: _countryCode,
              onChanged: (newValue) {
                setState(() {
                  _countryCode = newValue!;
                });
              },
              items: [
                DropdownMenuItem(value: '+1', child: Text('+1')),
                DropdownMenuItem(value: '+44', child: Text('+44')),
                DropdownMenuItem(value: '+90', child: Text('+90')),
              ],
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: 'Code',
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240)),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 10.sp),
              cursorHeight: 0,
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: label,
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, double screenWidth) {
    return Container(
      height: 45.h,
      child: DropdownButtonFormField<String>(
        value: _gender,
        onChanged: (newValue) {
          setState(() {
            _gender = newValue!;
          });
        },
        items: [
          DropdownMenuItem(value: 'Male', child: Text('Male')),
          DropdownMenuItem(value: 'Female', child: Text('Female')),
        ],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: label,
            labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 240, 240, 240)),
      ),
    );
  }

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

    String name = _nameController.text.trim();
    String surname = _surnameController.text.trim();
    String dob = _dobController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();

    // Check if any field is empty
    if (name.isEmpty || surname.isEmpty || dob.isEmpty || phone.isEmpty) {
      _showMessage('All fields are required');
      return;
    }

    // Save profile image to Firestore
    String profileImagePath = '';
    if (_profileImage != null) {
      profileImagePath = _profileImage!.path;
    }

    // Check if email needs to be updated
    bool emailChanged = email != user!.email;

    try {
      if (emailChanged && !_isSocialSignIn) {
        // E-posta doğrulama
        await user.verifyBeforeUpdateEmail(email);

        // E-posta doğrulandıktan sonra dinleme
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
          if (user != null && user.emailVerified) {
            await FirebaseFirestore.instance
                .collection('profiles')
                .doc(uid)
                .set({
              'name': name,
              'surname': surname,
              'dob': dob,
              'email': email,
              'phone': phone,
              'countryCode': _countryCode,
              'gender': _gender,
              'profileImage': profileImagePath,
            });
            nextScreenReplace(context, ProfilePage());
          }
        });
      } else {
        await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
          'name': name,
          'surname': surname,
          'dob': dob,
          'email': email,
          'phone': phone,
          'countryCode': _countryCode,
          'gender': _gender,
          'profileImage': profileImagePath,
        });
        nextScreenReplace(context, ProfilePage());
      }
    } catch (e) {
      _showMessage('An error occurred: $e');
    }
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
