import 'package:flutter/material.dart';
import 'package:vantech/dasboard page/dashboard.dart';
import 'package:vantech/dasboard page/history.dart';
import 'package:vantech/dasboard page/status.dart';
import 'package:vantech/profil/profil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

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
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              // Clickable notification card
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatusPage(),
                    ),
                  );
                },
                child: NotificationCard(
                  icon: Icons.delete,
                  iconColor: Colors.purple,
                  iconBackground: Colors.purple.withOpacity(0.1),
                  title: 'Kapasitas Tempat Sampah Maksimal',
                  subtitle: '🗑️ Tempat Sampah di Lokasi\n[Lokasi Anda] Telah Mencapai...',
                  time: '14.00',
                ),
              ),
              const SizedBox(height: 12),
              // Non-clickable notification cards
              NotificationCard(
                icon: Icons.warning,
                iconColor: Colors.red,
                iconBackground: Colors.red.withOpacity(0.1),
                title: '🚫 Error Detected! 🚫',
                subtitle: '🔧 Alat VangTech Tidak\nBerfungsi dengan Baik',
                time: '14.00',
              ),
              const SizedBox(height: 12),
              NotificationCard(
                icon: Icons.celebration,
                iconColor: Colors.amber,
                iconBackground: Colors.amber.withOpacity(0.1),
                title: 'Selamat Datang di VangTech!',
                subtitle: '👋 Terima kasih telah bergabung\ndengan kami!',
                time: '14.00',
              ),
            ],
          );
        },
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
                  // Already on notification page
                },
                child: const Icon(Icons.notifications_outlined,
                    color: Color(0xFF4A6741), size: 28),
              ),
              InkWell(
               onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                child: const Icon(Icons.person_outline,
                    color: Colors.grey, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final String time;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}