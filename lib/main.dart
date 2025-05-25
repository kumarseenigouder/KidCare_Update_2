// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'CreateAccountPage.dart';
import 'doctor_portal.dart';
import 'parent_portal.dart';
import 'admin_portal.dart';
import 'splash_screen.dart';
import 'custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidCare',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email == 'd@care.com' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DoctorPortal()),
      );
    } else if (email == 'p@care.com' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ParentPortal()),
      );
    } else if (email == 'a@care.com' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AdminPortal()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }

  void _goToCreateAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateAccountPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Login"),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              "KidCare",
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),

                  // Email TextField
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Colors.pink),
                      hintText: "Your e-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.pink),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("Login", style: TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(height: 15),

                  // Create Account
                  TextButton(
                    onPressed: _goToCreateAccount,
                    child: const Text("Don't have an account? Create one"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
