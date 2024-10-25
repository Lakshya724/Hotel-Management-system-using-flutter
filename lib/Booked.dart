import 'package:flutter/material.dart';

class BookingConfirmation extends StatelessWidget {
  final String roomType;
  final int price;

  const BookingConfirmation({super.key, required this.roomType, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have successfully booked the $roomType',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Total Price: \₹$price',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to Room_Details page
                },
                child: const Text('Back to Rooms'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
