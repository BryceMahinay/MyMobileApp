import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Required for validation
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.lightBlueAccent],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                Icon(Icons.person_add, size: 80, color: Colors.white),
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),

                // Validations based on your requirements
                _buildField("First Name", (v) => v!.isEmpty ? "Cannot be empty" : null),
                _buildField("Last Name", (v) => v!.isEmpty ? "Cannot be empty" : null),
                _buildField(
                    "Contact Number",
                        (v) => (v!.length < 10 || v.length > 15) ? "Must be 10-15 digits" : null,
                    keyboardType: TextInputType.phone
                ),
                _buildField("Username", (v) => v!.length < 4 ? "Minimum 4 characters" : null),
                _buildField(
                    "Password",
                        (v) => v!.length < 6 ? "Minimum 6 characters" : null,
                    obscure: true,
                    controller: _passController
                ),
                _buildField(
                    "Confirm Password",
                        (v) => v != _passController.text ? "Must match Password" : null,
                    obscure: true
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Logic for successful registration
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Account Created Successfully!")),
                      );
                    }
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Already have an account? Login here.",
                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create consistent TextFields without errors
  Widget _buildField(String hint, String? Function(String?) validator,
      {bool obscure = false, TextEditingController? controller, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}