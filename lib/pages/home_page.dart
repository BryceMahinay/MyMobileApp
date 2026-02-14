import 'package:flutter/material.dart'; // THIS LINE FIXES THE "NOT FOUND" ERRORS

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First Mobile App"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// --- HOME PAGE (Menu List) ---
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.indigo, Colors.lightBlueAccent],
        ),
      ),
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _itemCard("Burger", "35"),
          _itemCard("Ham & Egg Sandwich", "20"),
          _itemCard("Carbonara", "80"),
          _itemCard("Spaghetti", "80"),
          _itemCard("Iced Coffee", "30"),
          _itemCard("Milk Tea", "30"),
        ],
      ),
    );
  }

  Widget _itemCard(String name, String price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("₱$price"),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text("Order"),
        ),
      ),
    );
  }
}

// --- ORDER PAGE ---
class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your Order will display here", style: TextStyle(fontSize: 18)),
    );
  }
}

// --- PROFILE PAGE (New Section) ---
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.indigo, Colors.lightBlueAccent]),
            ),
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Stack(children: [
                  CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50)),
                  Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 15, backgroundColor: Colors.white, child: Icon(Icons.edit, size: 10, color: Colors.indigo))),
                ]),
                SizedBox(height: 10),
                Text("Bryce Mahinay", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                Text("@baraysss", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          _infoTile(Icons.email, "Email", "brycemahinay5@gmail.com"),
          _infoTile(Icons.phone, "Contact Number", "09123456789"),
          _infoTile(Icons.location_on, "Address", "Calamba Laguna, Philippines"),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.edit), label: Text("Edit Profile"), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45), backgroundColor: Colors.indigo, foregroundColor: Colors.white)),
              SizedBox(height: 10),
              ElevatedButton.icon(onPressed: () => Navigator.pop(context), icon: Icon(Icons.logout), label: Text("Logout"), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45), backgroundColor: Colors.redAccent, foregroundColor: Colors.white)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(child: ListTile(leading: Icon(icon, color: Colors.indigo), title: Text(title), subtitle: Text(value)));
  }
}