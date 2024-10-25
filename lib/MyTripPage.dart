import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

class MyTripPage extends StatefulWidget {
  @override
  _MyTripPageState createState() => _MyTripPageState();
}

class _MyTripPageState extends State<MyTripPage> {
  // Tracks the selected tab index
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trip'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab('Upcoming', 0),
                _buildTab('Finished', 1),
                _buildTab('Favorites', 2),
              ],
            ),
          ),
          Expanded(
            child: _buildTripList(selectedIndex), // Show trips based on the selected tab
          ),
        ],
      ),
    );
  }

  // Function to build the tab and make it clickable
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index on tap
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: selectedIndex == index ? Colors.black : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (selectedIndex == index)
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 3,
              width: 40,
              color: Colors.black, // Indicator for the selected tab
            )
        ],
      ),
    );
  }

  // Function to show trips based on selected tab
  Widget _buildTripList(int selectedTabIndex) {
    // Sample trip data for the different tabs
    final upcomingTrips = [
      _buildTripCard(
        name: 'Queen Hotel',
        location: 'Wembley, London',
        date: '01 May - 05 May',
        details: '1 Room 2 People',
        price: '\$230/per night',
        imagePath: 'assets/hotel_1.jpg',
      ),
      _buildTripCard(
        name: 'Grand Royal Hotel',
        location: 'Wembley, London',
        date: '01 May - 05 May',
        details: '1 Room 2 People',
        price: '\$250/per night',
        imagePath: 'assets/hotel_2.png',
      ),
    ];

    final finishedTrips = [
      _buildTripCard(
        name: 'Finished Trip 1',
        location: 'Wembley, London',
        date: '01 Jan - 03 Jan',
        details: '1 Room 1 Person',
        price: '\$180/per night',
        imagePath: 'assets/hotel_2.png',
      ),
    ];

    final favoriteTrips = [
      _buildTripCard(
        name: 'Paradise Hotels',
        location: 'Rajkot, Gujarat',
        date: '05 Jun - 10 Jun',
        details: '1 Room 2 People',
        price: '\$270/per night',
        imagePath: 'assets/hotel_Type_5.jpg',
      ),
    ];

    // Show trips based on the selected tab
    switch (selectedTabIndex) {
      case 0:
        return ListView(children: upcomingTrips);
      case 1:
        return ListView(children: finishedTrips);
      case 2:
        return ListView(children: favoriteTrips);
      default:
        return ListView(children: upcomingTrips);
    }
  }

  // Function to build the trip card (same as before)
  Widget _buildTripCard({
    required String name,
    required String location,
    required String date,
    required String details,
    required String price,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text('$date \n$details'),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
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
