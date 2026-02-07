// Import flutter's material design library
import 'package:flutter/material.dart';

//Landing Page
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();


}
class _LandingPageState extends State<LandingPage>{
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    ProfilePage(),

  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("My First Mobile"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _pages [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //highlight navigation icon
        currentIndex: _selectedIndex,

        selectedItemColor: Colors.indigo,

        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}
//Profile Page
class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //Logout Button
    return Center(
      child: ElevatedButton(
        onPressed:(){
          Navigator.pop(context);
        },
        //Button Text
        child: Text('Logout'),
      ),
    );
  }
}

//HOME PAGE
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo,
              Colors.lightBlueAccent
            ],
          )
      ),

      //List of Menu
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
}
//create widget for itemCard
Widget _itemCard(String name, String price){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
    ),
    margin: EdgeInsets.only(bottom: 12),
    child: ListTile(
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      subtitle: Text(price),
      trailing: ElevatedButton(
        onPressed: (){},
        child: Text("Order"),
      ),
    ),
  );
}

// ORDER PAGE
class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text("Your Oder will display here",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}