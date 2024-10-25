import 'package:flutter/material.dart';
import 'package:flutter_application_1/Booking.dart';
import 'package:flutter_application_1/Change_password.dart';
import 'package:flutter_application_1/EditProfile.dart';
import 'package:flutter_application_1/Forget_password.dart';
import 'package:flutter_application_1/HoteUI.dart';
import 'package:flutter_application_1/homepage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ms Dhoni',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    InkWell(
                      onTap: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),  // Profile page route
            );
                      },
                      child: 
                    Text(
                      'View and edit profile',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/Dhoni.webp'), // Replace with actual image
                ),
              ],
            ),
            SizedBox(height: 30),

            // Profile options
            ProfileOption(
              title: 'Change Password',
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordPage()),  // Trips page route
            );
              },
            ),
            
            ProfileOption(
              title: 'Forget Password',
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),  // Trips page route
            );
              },
            ),
            ProfileOption(
              title: 'Payment',
              onTap: () {
                // Handle Payment action
              },
            ),
            ProfileOption(
              title: 'Logout',
              onTap: () {
                Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HotelAppUI()),
    );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set to "Profile" page index
        iconSize: 30,
        onTap: (index) {
          if (index == 0) {
            // Navigate to Trips
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Replace with actual page
            );
          } else if (index == 1) {
            // Navigate to Explore
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelSearchScreen()), // Replace with actual page
            );
          } else if (index == 2) {
            // Already on Profile
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget? trailing;

  ProfileOption({required this.title, required this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
      ),
      onTap: () => onTap(),
      trailing: trailing ?? SizedBox.shrink(),
    );
  }
}
