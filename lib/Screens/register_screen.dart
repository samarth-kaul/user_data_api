import 'dart:convert';
import 'package:api_user_data/Models/UserRegisterRequest.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailCntr = TextEditingController();
  TextEditingController passCntr = TextEditingController();
  TextEditingController confirmPassCntr = TextEditingController();
  bool passwordsMatch = false;
  String verificationToken = "";
  bool registerSuccess = false;
  bool isLoading = false;

  void validatePasswords() {
    if (passCntr.text != confirmPassCntr.text) {
      setState(() {
        passwordsMatch = false;
      });
    } else {
      setState(() {
        passwordsMatch = true;
      });
    }
  }

  Future<void> _register(email, password) async {
    setState(() {
      isLoading = true;
    });
    UserRegisterRequest user = UserRegisterRequest(
        Email: email, Password: password, ConfirmPassword: password);
    try {
      final response = await http.post(
        Uri.parse('http://10.0.0.72:5490/api/User/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        print(response.body.toString());
        print("Registration successful!");
        verificationToken = response.body.toString();
        registerSuccess = true;
        // Navigator.pushReplacement(context~,
        //     MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print("Registration Failed - ${response.statusCode}: ${response.body}");
        registerSuccess = false;
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
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
                                "REGISTER",
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
                                        TextFormField(
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          decoration: const InputDecoration(
                                            labelText: "Re-enter Password",
                                            icon: Icon(
                                              Icons.password_rounded,
                                              color: Colors.black54,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          controller: confirmPassCntr,
                                          onChanged: (value) {
                                            validatePasswords();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(height: 30),
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(height: screenHeight * 0.06),
                                        GestureDetector(
                                          onTap: () {
                                            validatePasswords();
                                            if (passwordsMatch) {
                                              _register(emailCntr.text,
                                                  passCntr.text);

                                              if (registerSuccess) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomeScreen()));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Registration Failed")));
                                              }
                                            } else {
                                              print("passwords don't match");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "Passwords don't match")));
                                            }
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
                                              "Register",
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
                                            SvgPicture.asset(
                                              "assets/icon/google.svg",
                                              height: 40,
                                              width: 40,
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
                                              "Already have an account?  ",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                print("login pressed");
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginScreen()));
                                              },
                                              child: const Text(
                                                "Login",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
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
