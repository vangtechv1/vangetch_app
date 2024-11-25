import 'package:flutter/material.dart';
import 'package:vantech/page/signinpage.dart';
import 'package:vantech/page/signuppage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const HygieneHeroesApp());
}

class HygieneHeroesApp extends StatelessWidget {
  const HygieneHeroesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hygiene Heroes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HygieneHeroesHomePage(),
    );
  }
}

class HygieneHeroesHomePage extends StatelessWidget {
  const HygieneHeroesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3C3),
      body: Stack(
        children: [
          Positioned(
            top: -65,
            right: -20,
            child: Image.asset(
              'assets/png/bundar.png',
              width: 300,
              height: 300,
            ),
          ),
          // Main content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title Text
                  const Text(
                    'Hallo,\nHygiene Heroes!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4E3725),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle Text
                  const Text(
                    "Did you forget to empty the trash?\nNo worries, we'll help remind you!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6C6357),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Image asset code
                  Image.asset(
                    'assets/png/welcome.png',
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                      height: 30), // Add spacing between image and buttons
                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF557354), // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Create New Account Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF557354), // Greenish button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
