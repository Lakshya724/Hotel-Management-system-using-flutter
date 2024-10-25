import 'package:flutter/material.dart';
import 'package:flutter_application_1/HoteUI.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Signup.dart';

class PlanTripsScreen extends StatelessWidget {
  const PlanTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          size:30,
          color: Colors.black),
          
          onPressed: () { 
            Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HotelAppUI()),
    );
            // Add your back button action here
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            Image.asset(
              'assets/introduction1.png',
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 10),
            const Text(
              'Plan your trips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              
            ),
            const SizedBox(height: 10),
            Text(
              'book one of your unique hotel to\nescape the ordinary',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:(context) => LoginScreen()));
                // Add your login button action here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
              },
              child: const Text(
                'Create account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}