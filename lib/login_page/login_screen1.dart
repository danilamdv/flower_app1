import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/body_widgets/profile_page/fill_profile_screen.dart';
import 'package:flower_app/login_page/create_account.dart';
import 'package:flower_app/login_page/forgot_password1.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/services/iternet_provider.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flower_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  Color _emailIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  bool _isChecked = false;
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _authService.signIn(email, password);

    if (user != null) {
      // Giriş başarılı, profil ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FillProfileScreen(),
        ),
      );
    } else {
      // Giriş başarısız
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    width: screenWidth,
                    height: 40.0,
                    child: Image.asset("assets/leafphoto.png"),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Login to Your Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _emailIconColor = hasFocus ? Colors.green : Colors.grey;
                      });
                    },
                    child: TextField(
                      cursorHeight: 0,
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 10.0),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _emailIconColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: _emailIconColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 50.0,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _passwordIconColor =
                            hasFocus ? Colors.green : Colors.grey;
                      });
                    },
                    child: TextField(
                      cursorHeight: 0,
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _passwordIconColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _passwordIconColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 10.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _passwordIconColor,
                          size: 20.0,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: _passwordIconColor,
                            size: 20.0,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: screenWidth,
                  height: 20.0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            checkboxTheme: CheckboxThemeData(
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.white;
                              }),
                            ),
                          ),
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: screenWidth,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 10.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: screenWidth,
                  height: 30.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmailInputScreenForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot the password?",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
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
                            builder: (context) => EmailInputScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign up",
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
