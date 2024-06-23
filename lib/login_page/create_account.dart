import 'package:auth_buttons/auth_buttons.dart';
import 'package:flower_app/body_widgets/profile_page/fill_profile_screen.dart';
import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flower_app/login_page/password_input_screen.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/services/iternet_provider.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flower_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EmailInputScreen extends StatefulWidget {
  @override
  _EmailInputScreenState createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  final TextEditingController _emailController = TextEditingController();
  Color _emailIconColor = Colors.grey;

  void _goToPasswordScreen() {
    String email = _emailController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordInputScreen(email: email),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> handleFacebookAuth() async {
    final sp = context.read<FirebaseAuthService>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  Future<void> handleTwitterAuth() async {
    final sp = context.read<FirebaseAuthService>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
    } else {
      await sp.signInWithTwitter().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  Future<void> handleGoogleSignIn() async {
    final sp = context.read<FirebaseAuthService>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  void handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, FillProfileScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, top: 50.h),
                  child: Container(
                    width: screenWidth,
                    height: 40.h,
                    child: Image.asset("assets/leafphoto.png"),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 100.h,
                  child: Center(
                    child: Text(
                      "Email Adresinizi Girin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _emailIconColor = hasFocus ? Colors.green : Colors.grey;
                      });
                    },
                    child: TextField(
                      cursorHeight: 0,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 10.sp),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _emailIconColor, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: _emailIconColor,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _goToPasswordScreen,
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Container(
                  width: screenWidth,
                  height: 70.0,
                  child: Center(
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 35.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleAuthButton(
                        onPressed: handleGoogleSignIn,
                        style: AuthButtonStyle(
                          buttonType: AuthButtonType.icon,
                          iconSize: 20.0,
                          buttonColor: Colors.white,
                          borderWidth: 1.0,
                          borderColor: Colors.black12,
                        ),
                      ),
                      FacebookAuthButton(
                        onPressed: handleFacebookAuth,
                        style: AuthButtonStyle(
                          buttonType: AuthButtonType.icon,
                          iconSize: 20.0,
                          buttonColor: Colors.white,
                          iconColor: Colors.blue,
                          borderWidth: 1.0,
                          borderColor: Colors.black12,
                        ),
                      ),
                      TwitterAuthButton(
                        onPressed: handleTwitterAuth,
                        style: AuthButtonStyle(
                          buttonType: AuthButtonType.icon,
                          iconSize: 20.0,
                          buttonColor: Colors.white,
                          iconColor: Colors.black,
                          borderWidth: 1.0,
                          borderColor: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: screenWidth,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Already have a account? Sign in",
                        style: TextStyle(
                          fontSize: 9.0,
                          color: Colors.green,
                        ),
                      ),
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
}
