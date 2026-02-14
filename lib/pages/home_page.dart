import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[50], // Light background for the whole app
      appBar: AppBar(
        title: Text("My First Mobile App", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
        centerTitle: true,
        elevation: 0.5,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[700],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
        ],
      ),
    );
  }
}

// --- HOME PAGE (Styled Menu) ---
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.indigo[800]!, Colors.indigo[400]!],
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
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text("₱$price", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 16)),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: StadiumBorder(),
          ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          SizedBox(height: 10),
          Text("Your Order will display here", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

// --- PROFILE PAGE (Creative Concept) ---
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.indigo[900]!, Colors.indigo[400]!]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Stack(children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white24,
                    child: CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: Colors.indigo)),
                  ),
                  Positioned(
                    bottom: 0, right: 0,
                    child: CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(Icons.edit, size: 18, color: Colors.indigo)),
                  ),
                ]),
                SizedBox(height: 15),
                Text("Bryce Mahinay", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                Text("@baraysss", style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),

          // Info Card
          Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  _infoTile(Icons.email_outlined, "Email", "brycemahinay5@gmail.com.com"),
                  Divider(indent: 70, height: 1),
                  _infoTile(Icons.phone_android_outlined, "Contact Number", "09123456789"),
                  Divider(indent: 70, height: 1),
                  _infoTile(Icons.location_on_outlined, "Address", "Calamba Laguna, Philippines"),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined),
                  label: Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    backgroundColor: Colors.indigo[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.logout_rounded),
                  label: Text("Logout"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    foregroundColor: Colors.redAccent,
                    side: BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.indigo[50], child: Icon(icon, color: Colors.indigo, size: 20)),
      title: Text(title, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      subtitle: Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
    );
  }
}