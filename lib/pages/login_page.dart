// Import flutter's material design library
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Visual Layout
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                //Setting color of the first line
                end: Alignment.bottomCenter,
                //Settings color of the second line

                colors: [
                  Colors.indigo,
                  Colors.lightBlueAccent
                ])
        ),

        //Padding for Spaces in the edges
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //lock icon
              Icon(Icons.lock, size: 80, color: Colors.white),

              //Space between Icon and text
              SizedBox(height: 20),
              //Display text
              Text(
                "Welcome Back !!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),


              SizedBox(height: 20),

              //Email input field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),
                ),
              ),

              SizedBox(height: 20),

              //password input field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),
                ),
              ),

              SizedBox(height: 20),
              //login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },

                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}