import 'package:auth_buttons/auth_buttons.dart';
import 'package:flower_app/body_widgets/profile_page/fill_profile_screen.dart';
import 'package:flower_app/login_page/create_account.dart';
import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/services/iternet_provider.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flower_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 10.h,
          right: 10.r,
          left: 10.r,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth,
                height: 150.h,
                child: Image.asset(
                  'assets/welcome1.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "Let's you in",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              isLoading
                  ? CircularProgressIndicator()
                  : FacebookAuthButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await handleFacebookAuth();
                        setState(() {
                          isLoading = false;
                        });
                      },
                      text: 'Sign in with Facebook',
                      style: AuthButtonStyle(
                        iconSize: 24.r,
                        iconType: AuthIconType.secondary,
                        iconBackground: Colors.white,
                        buttonColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        width: screenWidth,
                        height: 45.h,
                      ),
                    ),
              SizedBox(height: 10.h),
              isLoading
                  ? CircularProgressIndicator()
                  : GoogleAuthButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await handleGoogleSignIn();
                        setState(() {
                          isLoading = false;
                        });
                      },
                      text: 'Continue with Google',
                      style: AuthButtonStyle(
                        iconSize: 24.r,
                        iconType: AuthIconType.secondary,
                        iconBackground: Colors.white,
                        buttonColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        width: screenWidth,
                        height: 45.h,
                      ),
                    ),
              SizedBox(height: 10.h),
              isLoading
                  ? CircularProgressIndicator()
                  : TwitterAuthButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await handleTwitterAuth();
                        setState(() {
                          isLoading = false;
                        });
                      },
                      text: 'Continue with twitter',
                      style: AuthButtonStyle(
                        iconColor: Colors.black,
                        iconSize: 24.r,
                        iconBackground: Colors.white,
                        buttonColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        width: screenWidth,
                        height: 45.h,
                      ),
                    ),
              SizedBox(height: 20.h),
              Text(
                'or',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 20.h),
              Container(
                width: screenWidth,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Sign in with password',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailInputScreen(),
                        ));
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(fontSize: 9.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // handling facebookauth
  Future handleFacebookAuth() async {
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

  Future handleTwitterAuth() async {
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
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
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

  // handling google sigin in
  Future handleGoogleSignIn() async {
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

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, FillProfileScreen());
    });
  }
}
