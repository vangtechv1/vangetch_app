import 'package:flutter/material.dart';
import 'package:vantech/profil/profil.dart';

class PengaturanNotifPage extends StatefulWidget {
  const PengaturanNotifPage({Key? key}) : super(key: key);

  @override
  State<PengaturanNotifPage> createState() => _PengaturanNotifPageState();
}

class _PengaturanNotifPageState extends State<PengaturanNotifPage> {
  bool notificationEnabled = true;

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
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        title: const Text(
          'Pengaturan Notification',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notification in Application',
                    style: TextStyle(fontSize: 14),
                  ),
                  Switch(
                    value: notificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF708E64),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
