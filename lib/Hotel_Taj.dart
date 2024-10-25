import 'package:flutter/material.dart';
import 'package:flutter_application_1/Booked.dart';
import 'package:flutter_application_1/Booking.dart';
import 'package:flutter_application_1/BookingConfirmation.dart'; // Import the new page

class HotelTaj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taj Hotel'),
        centerTitle: true,
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HotelSearchScreen()),
            );
          },
        ),
        actions: [
          Icon(Icons.favorite_border),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          roomCard(
            context, // Pass context to the roomCard method
            imagePath: 'assets/hotel_room_3.jpg',
            roomType: 'Deluxe Room',
            price: 5500,
            location: 'Mumbai',
          ),
          SizedBox(height: 10.0),
          roomCard(
            context, // Pass context to the roomCard method
            imagePath: 'assets/hotel_room_4.jpg',
            roomType: 'Premium Room',
            price: 7500,
            location: 'Mumbai',
          ),
        ],
      ),
    );
  }

  Widget roomCard(BuildContext context, {required String imagePath, required String roomType, required int price, required String location}) {
    return Card(
      elevation: 25,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.asset(
                  imagePath,
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    location,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomType,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Sleeps 2 People + 2 children'),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\₹$price/per night',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirmation(roomType: roomType, price: price), // Pass room type and price
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          'Book now',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
