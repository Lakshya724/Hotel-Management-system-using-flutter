import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController(text: 'Mahendra Singh Dhoni');
  final TextEditingController _emailController = TextEditingController(text: 'MSD07@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+91 7777777777');
  final TextEditingController _dobController = TextEditingController(text: '07/07/1981');
  final TextEditingController _addressController = TextEditingController(text: 'Ranchi, Bihar (present-day Jharkhand), India');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wraps the content with scrollable view
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Dhoni.webp'), // Replace with actual image
                ),
              ),
              const SizedBox(height: 30),

              // User Name (Editable)
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Email (Editable)
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Phone (Editable)
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Date of Birth (Editable)
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),

              // Address (Editable)
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Profile Saved');
                    print('Name: ${_nameController.text}');
                    print('Email: ${_emailController.text}');
                    print('Phone: ${_phoneController.text}');
                    print('DOB: ${_dobController.text}');
                    print('Address: ${_addressController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
