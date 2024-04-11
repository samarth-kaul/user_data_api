import 'package:api_user_data/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "images/back_image.png",
                  scale: 0.5,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "WELCOME, USER",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Nor hence hoped her after other known defer his. "
                "For county now sister engage had season better had waited. "
                "Occasional mrs interested far expression acceptance. "
                "Day either mrs talent pulled men rather regret admire but. "
                "Life ye sake it shed. Five lady he cold in meet up. ",
                style: TextStyle(color: Colors.white60),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  // color: Colors.white60,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "REGISTER",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Version 1.0.1",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
