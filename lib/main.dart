import 'package:flutter/material.dart';

void main() {
  runApp(BusBookingApp());
}

class BusBookingApp extends StatelessWidget {
  const BusBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terravia Bus Booking',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

// Home Screen (First Screen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Menu functionality would go here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: 'EN',
              underline: Container(),
              icon: Icon(Icons.arrow_drop_down),
              items: <String>['EN', 'HI', 'TA', 'TE']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Language change logic would go here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined, color: Colors.black),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, Jane',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "I'm Terravia",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'How can I help you today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Message Terravia.....',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.mic),
                            onPressed: () {
                              // Voice input functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BusSearchScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: Text('Find my bus', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Live bus tracking functionality
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: Text('Live bus tracking', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Buy tickets functionality
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Text('Buy tickets', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Bus Search Screen (Second Screen)
class BusSearchScreen extends StatefulWidget {
  const BusSearchScreen({super.key});

  @override
  _BusSearchScreenState createState() => _BusSearchScreenState();
}

class _BusSearchScreenState extends State<BusSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<BusRoute> _filteredBusRoutes = [];

  // Sample bus routes data
  final List<BusRoute> _busRoutes = [
    BusRoute(
      from: 'Thillai nagar',
      to: 'Central bus stand',
      arrivalTime: '7:45 A.M.',
      availableSeats: 17,
      imageUrl: 'assets/bus_blue.jpg',
    ),
    BusRoute(
      from: 'Thillai nagar',
      to: 'Central bus stand',
      arrivalTime: '7:55 A.M.',
      availableSeats: 32,
      imageUrl: 'assets/bus_blue.jpg',
    ),
    BusRoute(
      from: 'Thillai nagar',
      to: 'Central bus stand',
      arrivalTime: '8:10 A.M.',
      availableSeats: 70,
      imageUrl: 'assets/bus_blue.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredBusRoutes = List.from(_busRoutes);
    _searchController.addListener(_filterBusRoutes);
  }

  void _filterBusRoutes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredBusRoutes = List.from(_busRoutes);
      } else {
        _filteredBusRoutes = _busRoutes
            .where((route) =>
        route.from.toLowerCase().contains(query) ||
            route.to.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Enter destination...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Available buses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBusRoutes.length,
                itemBuilder: (context, index) {
                  final route = _filteredBusRoutes[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          child: Image.network(
                            'https://5.imimg.com/data5/SELLER/Default/2022/12/NJ/HT/AJ/53378350/non-ac-bus-on-rent-500x500.jpg',
                            width: 100,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${route.from} - ${route.to}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Arrival Time: ${route.arrivalTime} (your destination)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Available seats: ${route.availableSeats}${route.availableSeats < 20 ? " (filling fast)" : ""}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketScreen(
                                    busName: '45-E',
                                    from: 'Broadway',
                                    to: 'Thiruvotriyur',
                                    amount: '₹5.00',
                                    passengerName: 'Vishanth',
                                  ),
                                ),
                              );
                            },
                            child: Text('Book Now'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to home'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// E-Ticket Screen (Third Screen)
class TicketScreen extends StatelessWidget {
  final String busName;
  final String from;
  final String to;
  final String amount;
  final String passengerName;

  const TicketScreen({super.key,
    required this.busName,
    required this.from,
    required this.to,
    required this.amount,
    required this.passengerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bus E-Ticket',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 320,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.indigo[800],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildTicketRow('Passenger:', passengerName),
                  SizedBox(height: 16),
                  _buildTicketRow('Bus Name:', busName),
                  SizedBox(height: 16),
                  _buildTicketRow('From:', from),
                  SizedBox(height: 16),
                  _buildTicketRow('To:', to),
                  SizedBox(height: 16),
                  _buildTicketRow('Payment:', 'Wallet'),
                  SizedBox(height: 16),
                  _buildTicketRow('Amount:', amount),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      // Download ticket functionality
                    },
                    child: Text('Download Ticket (PDF)'),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                },
                child: Text('Back to home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

// Model class for bus routes
class BusRoute {
  final String from;
  final String to;
  final String arrivalTime;
  final int availableSeats;
  final String imageUrl;

  BusRoute({
    required this.from,
    required this.to,
    required this.arrivalTime,
    required this.availableSeats,
    required this.imageUrl,
  });
}