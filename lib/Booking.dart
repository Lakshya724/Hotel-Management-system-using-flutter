import 'package:flutter/material.dart';
import 'package:flutter_application_1/Grand%20Royal.dart';
import 'package:flutter_application_1/Hotel_Taj.dart';
import 'package:flutter_application_1/Presidency.dart';
import 'package:flutter_application_1/Room_Details.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:intl/intl.dart';

class HotelSearchScreen extends StatefulWidget {
  const HotelSearchScreen({super.key});

  @override
  HotelSearchScreenState createState() => HotelSearchScreenState();
}

class HotelSearchScreenState extends State<HotelSearchScreen> {
  DateTimeRange? _selectedDateRange;
  int _numberOfRooms = 1;
  int _numberOfPeople = 2;

  // Format the dates for display
  String getDateRangeText() {
    if (_selectedDateRange == null) {
      return 'Choose Date';
    } else {
      final startDate = DateFormat('d MMM').format(_selectedDateRange!.start);
      final endDate = DateFormat('d MMM').format(_selectedDateRange!.end);
      return '$startDate - $endDate';
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: _selectedDateRange,
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  // Function to navigate to the RoomSelectionPage and get the result
  Future<void> _selectRoomAndPeople() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSelectionPage(
          numberOfRooms: _numberOfRooms,
          numberOfPeople: _numberOfPeople,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        _numberOfRooms = result['rooms'];
        _numberOfPeople = result['people'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigating to HomePage on back arrow press
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  HomePage()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Icon(Icons.search,),
          ),
        ],
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Rajkot....',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _selectDateRange(context);
                  },
                  child: Row(
                    children: [
                      Text(getDateRangeText(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Icon(Icons.calendar_today, size: 15),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _selectRoomAndPeople,
                  child: const Text('Number of room',
                  style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$_numberOfRooms room $_numberOfPeople people',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 0),
            Expanded(
              child: ListView(
                children: [
                  hotelCard('Grand Royal Hotel', 'Rajkot Gujarat', '49 km..', 5000, 'assets/hotel_1.jpg'),
                  hotelCard1('Taj Hotel', 'Mumbai Maharastra', '125 km..', 4000, 'assets/hotel_2.png'),
                  hotelCard2('Hotel presidency', 'Daman', '150 km..', 6500, 'assets/hotel_6.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hotelCard(String hotelName, String location, String distance, int price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Room_Details(),
              ),
            );
          },
          
          child: Image.asset(imagePath, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotelName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$location • $distance', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text('\₹$price / per night', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hotelCard1(String hotelName, String location, String distance, int price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>HotelTaj(),
              ),
            );
          },
          
          child: Image.asset(imagePath, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotelName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$location • $distance', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text('\₹$price / per night', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget hotelCard2(String hotelName, String location, String distance, int price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Presidency(),
              ),
            );
          },
          
          child: Image.asset(imagePath, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotelName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$location • $distance', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text('\₹$price / per night', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

// RoomSelectionPage for selecting rooms and people
class RoomSelectionPage extends StatefulWidget {
  final int numberOfRooms;
  final int numberOfPeople;

  const RoomSelectionPage({super.key, required this.numberOfRooms, required this.numberOfPeople});

  @override
  // ignore: library_private_types_in_public_api
  _RoomSelectionPageState createState() => _RoomSelectionPageState();
}

class _RoomSelectionPageState extends State<RoomSelectionPage> {
  late int _numberOfRooms;
  late int _numberOfPeople;

  @override
  void initState() {
    super.initState();
    _numberOfRooms = widget.numberOfRooms;
    _numberOfPeople = widget.numberOfPeople;
  }

  void _incrementRooms() {
    setState(() {
      _numberOfRooms++;
    });
  }

  void _decrementRooms() {
    setState(() {
      if (_numberOfRooms > 1) {
        _numberOfRooms--;
      }
    });
  }

  void _incrementPeople() {
    setState(() {
      _numberOfPeople++;
    });
  }

  void _decrementPeople() {
    setState(() {
      if (_numberOfPeople > 1) {
        _numberOfPeople--;
      }
    });
  }

  void _applySelection() {
    Navigator.pop(context, {'rooms': _numberOfRooms, 'people': _numberOfPeople});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Number of Room',
              style: TextStyle(fontSize: 18,),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decrementRooms,
                ),
                Text(
                  '$_numberOfRooms',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementRooms,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'People',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decrementPeople,
                ),
                Text(
                  '$_numberOfPeople',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementPeople,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _applySelection,
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}