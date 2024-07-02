import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String? _profileImageUrl;

  String _countryCode = '+1';
  String _gender = 'Male';
  bool _isSocialSignIn = false;
  bool _isImagePickerActive = false; // Yeni state

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

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
      _usernameController.text = data?['username'] ?? '';
      _dobController.text = data?['dob'] ?? '';
      _emailController.text = data?['email'] ?? '';
      _phoneController.text = data?['phone'] ?? '';
      _countryCode = data?['countryCode'] ?? '+1';
      _gender = data?['gender'] ?? 'Male';
      _profileImageUrl = data?['profileImage'] ?? '';

      // Boş veya geçersiz URL'ler için varsayılan resim URL'si kullan
      if (_profileImageUrl == null || _profileImageUrl!.isEmpty) {
        _profileImageUrl =
            'https://via.placeholder.com/150'; // Varsayılan resim URL'si
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
  }

  Future<String> _uploadProfileImage(File image) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';
    String fileName =
        'profile_images/$uid-${DateTime.now().millisecondsSinceEpoch}.jpg';

    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageRef.putFile(image);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  void _pickImage() async {
    if (_isImagePickerActive)
      return; // Eğer bir resim seçme işlemi aktifse yeni işlem başlatma

    setState(() {
      _isImagePickerActive = true; // Resim seçme işlemini aktif olarak işaretle
    });

    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });

        String downloadUrl = await _uploadProfileImage(_profileImage!);

        User? user = FirebaseAuth.instance.currentUser;
        String uid = user?.uid ?? '';

        // Kullanıcı belgesini kontrol et ve oluştur
        DocumentReference profileRef =
            FirebaseFirestore.instance.collection('profiles').doc(uid);
        DocumentSnapshot snapshot = await profileRef.get();
        if (!snapshot.exists) {
          await profileRef.set({
            'profileImage': downloadUrl,
            'name': '',
            'username': '',
            'dob': '',
            'email': '',
            'phone': '',
            'countryCode': '+1',
            'gender': 'Male',
          });
        } else {
          await profileRef.update({
            'profileImage': downloadUrl,
          });
        }

        setState(() {
          _profileImageUrl = downloadUrl;
          _profileImage = null; // Cihazdaki resmi temizle, sadece URL'den yükle
        });
      }
    } catch (e) {
      print("Image picking error: $e");
    } finally {
      setState(() {
        _isImagePickerActive = false; // Resim seçme işlemini tamamla
      });
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
                        backgroundImage: _profileImageUrl != null &&
                                _profileImageUrl!.isNotEmpty
                            ? NetworkImage(_profileImageUrl!)
                            : AssetImage('assets/empty-profile.png')
                                as ImageProvider,
                        child: _profileImageUrl == null ||
                                _profileImageUrl!.isEmpty
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
                SizedBox(
                  height: 20.0.h,
                ),
                _buildTextField(_nameController, 'Name', screenWidth),
                SizedBox(
                  height: 20.0.h,
                ),
                _buildTextField(_usernameController, 'Username', screenWidth),
                SizedBox(
                  height: 20.0.h,
                ),
                _buildDateField(_dobController, 'Date of Birth', screenWidth),
                SizedBox(
                  height: 20.0.h,
                ),
                _buildTextField(_emailController, 'Email', screenWidth),
                SizedBox(height: 20.0.h),
                _buildPhoneField(_phoneController, 'Phone Number', screenWidth),
                SizedBox(
                  height: 20.0.h,
                ),
                _buildDropdownField('Gender', screenWidth),
                SizedBox(
                  height: 20.0.h,
                ),
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
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (selectedDate != null) {
            String formattedDate =
                DateFormat('yyyy-MM-dd').format(selectedDate);
            controller.text = formattedDate;
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
      child: TextField(
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
            fillColor: Color.fromARGB(255, 240, 240, 240)),
      ),
    );
  }

  Widget _buildDropdownField(String label, double screenWidth) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color.fromARGB(255, 240, 240, 240),
      ),
      child: DropdownButton<String>(
        value: _gender,
        onChanged: (String? newValue) {
          setState(() {
            _gender = newValue!;
          });
        },
        items: <String>['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: SizedBox(), // Dropdown'daki underline'ı kaldırır
        isExpanded: true, // Dropdown'u tam genişlikte yapar
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  void _saveProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

    Map<String, dynamic> profileData = {
      'name': _nameController.text,
      'username': _usernameController.text,
      'dob': _dobController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'countryCode': _countryCode,
      'gender': _gender,
      'profileImage':
          _profileImageUrl ?? '', // Varsayılan profil resmi URL'sini kaydedin
    };

    await FirebaseFirestore.instance.collection('profiles').doc(uid).set(
          profileData,
          SetOptions(merge: true),
        );

    // Profil güncellemesi başarılı olduğunda profil sayfasına geçiş
    nextScreen(context, ProfilePage());
  }
}
