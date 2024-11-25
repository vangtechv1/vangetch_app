import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AkunDanKeamananPage extends StatefulWidget {
  const AkunDanKeamananPage({Key? key, required String email}) : super(key: key);

  @override
  State<AkunDanKeamananPage> createState() => _AkunDanKeamananPageState();
}

class _AkunDanKeamananPageState extends State<AkunDanKeamananPage> {
  String _userName = 'User'; // Default name
  String _userEmail = 'Email not found'; // Default email
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      // Retrieve the email from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('userEmail');

      if (email == null) {
        print('No email found');
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Save email to state
      setState(() {
        _userEmail = email;
      });

      // Fetch user profile
      final response = await http.get(
        Uri.parse('https://backendapp-vangtech2.vercel.app/api/user/profile?email=$email'),
      );

      if (response.statusCode == 200) {
        final profileData = jsonDecode(response.body);
        setState(() {
          _userName = profileData['name'] ?? 'User'; // Assign the name from the response
          isLoading = false;
        });
      } else {
        print('Failed to fetch profile: ${response.body}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching profile: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Akun dan Keamanan',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profil Saya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _buildProfileItem('Full Name', _userName),
                        const Divider(),
                        _buildProfileItem('Email', _userEmail),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
