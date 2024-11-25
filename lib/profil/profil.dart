import 'package:flutter/material.dart';
import 'package:vantech/dasboard page/dashboard.dart';
import 'package:vantech/dasboard page/history.dart';
import 'package:vantech/dasboard%20page/notification.dart';
import 'package:vantech/profil/editpage.dart';
import 'package:vantech/profil/keamanan.dart';
import 'package:vantech/profil/logoutpage.dart';
import 'package:vantech/profil/pengaturan.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  
  get onTap => null;

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            color: const Color(0xFF4A6741), // Green background
            height: 100,
            width: double.infinity,
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Column(
              children: [
                Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey,
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/5921/5921788.png',
                      fit: BoxFit.cover,
                      width: 96, 
                      height: 96, 
                    ),
                  ),
                ),
              ),

                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6741),
                    minimumSize: const Size(120, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Edit Profile', style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),
                  
                ),
              ],
            ),
          ),
          
          // Menu Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 16.0),
                  child: Text(
                    'Akun Saya',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildMenuItem(
                  title: 'Keamanan & Akun',
                  onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AkunDanKeamananPage(email: '',)),
                  );
                },
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Pengaturan',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildMenuItem(
                  title: 'Pengaturan Notifikasi',
                  onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PengaturanNotifPage()),
                  );
                },
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Bantuan',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogoutPage()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A6741),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Logout', style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Icon(Icons.home_filled, color: Colors.grey, size: 28),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoryPage()),
                  );
                },
                child: const Icon(Icons.calendar_today,
                    color: Colors.grey, size: 28),
              ),
              InkWell(
                onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()),
                      );
                    },
                child: const Icon(Icons.notifications_outlined,
                    color: Colors.grey, size: 28),
              ),
              InkWell(
                onTap: () {
                  // Add navigation to profile page
                },
                child: const Icon(Icons.person_outline,
                    color: Color(0xFF4A6741), size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black54,
        ),
        onTap: onTap,
      ),
    );
  }
}