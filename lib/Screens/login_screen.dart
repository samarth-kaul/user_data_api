import 'dart:convert';
import 'package:api_user_data/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../Models/UserLoginRequest.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCntr = TextEditingController();
  TextEditingController passCntr = TextEditingController();
  bool isLoading = false;

  Future<void> login(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    UserLoginRequest user = UserLoginRequest(Email: email, Password: password);

    try {
      print("in try");
      print(email);
      print(password);
      print(user);
      final response = await http.post(
          Uri.parse("http://10.0.0.72:5490/api/User/login"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Charset': 'utf-8'
          },
          body: jsonEncode(user.toJson()));

      if (response.statusCode == 200) {
        print(response.body.toString());
        print("login successful");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print("Login Failed - ${response.statusCode}: ${response.body}");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sign in failed")));
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GoogleSignInAccount?> googleLogin() async {
    print("google sign in pressed");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();

      print("Email: ${result?.email}");
      print("Name: ${result?.displayName}");
      print("ID: ${result?.id}");
      print("Image URL: ${result?.photoUrl}");
      print("Auth Code: ${result?.serverAuthCode}");
      // print(result?._idToken);

      return result;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: isLoading
            ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                ),
              )
            : Scaffold(
                body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff252525), Color(0xff1D1D1D)]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.25,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 120, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Color(0xffFBF9F1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 47),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white54.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, -3),
                              )
                            ],
                            // color: Color(0xffEEEDEB),
                            color: Color(0xffF8F4EC),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.07,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          offset: const Offset(0, 8),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: "Email",
                                            border: InputBorder.none,
                                            icon: Icon(
                                              Icons.email_rounded,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          controller: emailCntr,
                                        ),
                                        TextFormField(
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          decoration: const InputDecoration(
                                            labelText: "Password",
                                            icon: Icon(
                                              Icons.password_rounded,
                                              color: Colors.black54,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          controller: passCntr,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<dynamic>(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor:
                                              const Color(0xff252525),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30)),
                                          ),
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.04,
                                                    ),
                                                    const Text(
                                                      "Enter your email below",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white70,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.04,
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: screenHeight * 0.04),
                                      GestureDetector(
                                        onTap: () {
                                          login(emailCntr.text, passCntr.text);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xff252525),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 70, vertical: 16),
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Divider(
                                        indent: screenWidth * 0.1,
                                        endIndent: screenWidth * 0.1,
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.04,
                                        child: Center(
                                          child: Text(
                                            "Login Via..",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var res = googleLogin();
                                              if (res != null) {
                                                print(res);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomeScreen()));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Signed in successfully")));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Sign in failed")));
                                              }
                                            },
                                            child: SvgPicture.asset(
                                              "assets/icon/google.svg",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icon/facebook.svg",
                                            height: 40,
                                            width: 40,
                                          ),
                                          SvgPicture.asset(
                                            "assets/icon/github.svg",
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenHeight * 0.03),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Don't have an account?  ",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("sign up pressed");
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterScreen()));
                                            },
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
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

//
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// GestureDetector(
// onTap: () {},
// child: Container(
// decoration: const BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.all(
// Radius.circular(40),
// ),
// ),
// // padding: const EdgeInsets.symmetric(
// //     horizontal: 50, vertical: 16),
// width: 140,
// height: 50,
// child: Center(
// child: const Text(
// "Gmail",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// )),
// ),
// ),
// GestureDetector(
// onTap: () {},
// child: Container(
// width: 140,
// height: 50,
// decoration: const BoxDecoration(
// color: Color(0xff316FF6),
// borderRadius: BorderRadius.all(
// Radius.circular(40),
// ),
// ),
// child: const Center(
// child: Text(
// "Facebook",
// style: TextStyle(
// fontSize: 16,
// fontWeight:
// FontWeight.bold),
// ),
// ),
// ),
// ),
// ],
// ),
