import 'dart:io';
import 'dart:ui';

import 'package:flower_app/body_widgets/profile_page/profile_page.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _saveProfile() {
    String name = _nameController.text;
    String surname = _surnameController.text;
    String dob = _dobController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    print('Name: $name');
    print('Surname: $surname');
    print('DOB: $dob');
    print('Email: $email');
    print('Phone: $phone');
    print('Country Code: $_countryCode');
    print('Gender: $_gender');
    completed(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
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
                            ? Icon(
                                Icons.camera_alt,
                                size: 40.r,
                              )
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
                SizedBox(height: 20.0.h),
                _buildTextField(_nameController, 'Name', screenWidth),
                SizedBox(height: 20.0.h),
                _buildTextField(_surnameController, 'Surname', screenWidth),
                SizedBox(height: 20.0.h),
                _buildDateField(_dobController, 'Date of Birth', screenWidth),
                SizedBox(height: 20.0.h),
                _buildTextField(_emailController, 'Email', screenWidth),
                SizedBox(height: 20.0.h),
                _buildPhoneField(_phoneController, 'Phone Number', screenWidth),
                SizedBox(height: 20.0.h),
                _buildDropdownField('Gender', screenWidth),
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
      TextEditingController controller, String label, double screenWidth) {
    return Container(
      height: 45.h,
      child: TextField(
        style: TextStyle(
          fontSize: 10.sp,
        ),
        cursorHeight: 0,
        controller: controller,
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
              controller.text =
                  '${pickedDate.month}/${pickedDate.day}/${pickedDate.year}';
            });
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 15.r,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField(
    TextEditingController controller,
    String label,
    double screenWidth,
  ) {
    return Container(
      height: 45.h,
      child: TextField(
        style: TextStyle(
          fontSize: 10.sp,
        ),
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          labelText: label,
          labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          prefixIcon: DropdownButton<String>(
            value: _countryCode,
            items:
                <String>['+1', "+994", '+90', '+44', '+33'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _countryCode = newValue!;
              });
            },
            underline: SizedBox(),
            iconSize: 0.0,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, double screenWidth) {
    return Container(
      alignment: Alignment.center,
      height: 55.h,
      child: DropdownButtonFormField<String>(
        value: _gender,
        items: <String>['Male', 'Female', 'Other'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _gender = newValue!;
          });
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Future<dynamic> completed(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Container(
                        height: 100.h, child: Image.asset("assets/check.png")),
                  ),
                  SizedBox(height: 20.h),
                  // Başarılı mesajı
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Your account is ready to use. You will be redirected to the home page in a few seconds.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                      onPressed: () =>
                          nextScreenReplace(context, ProfilePage()),
                      child: Text("next"))
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
