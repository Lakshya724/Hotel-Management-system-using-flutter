import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DashboardScreen()));
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blueGrey[600],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/Dhoni.webp'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey[600]),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.hotel),
              title: Text('Room Management'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('User Management'),
            ),
            ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: Text('Staff Management'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, Lakshya!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Stats Grid for mobile (column layout for small screens)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildStatCard("Rooms", "11", Colors.blue)),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildStatCard(
                            "All Room Bookings", "4", Colors.lightBlue)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatCard(
                            "All users", "3", Colors.purple)),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildStatCard("Staff", "9", Colors.green)),
                  ],
                ),
                SizedBox(height: 10),
                
              ],
            ),
            SizedBox(height: 20),
            // Recent Bookings Table for Mobile
            Column(
              children: [
                _buildRecentBookingsTable("Recent Room Bookings"),
                SizedBox(height: 20),
                // _buildRecentBookingsTable("Recent Package Bookings"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, Color color) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentBookingsTable(String title) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // For mobile, you can use a simpler list layout instead of a table
          _buildBookingRow("Radisson Hotel", "USD 400", "Paid"),
          _buildBookingRow("Cambria Hotel", "USD 360", "Paid"),
          _buildBookingRow("Four Points", "USD 290", "Pending"),
        ],
      ),
    );
  }

  Widget _buildBookingRow(String name, String cost, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              cost,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              status,
              style: TextStyle(
                color: status == "Paid" ? Colors.green : Colors.orange,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Select"),
            ),
          ),
        ],
      ),
    );
  }
}
