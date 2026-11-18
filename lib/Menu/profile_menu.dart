import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 66, 157, 69),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama'),
              subtitle: Text('Ahmad Kenzie Javas Niscala'),
            ),
            const ListTile(
              leading: Icon(Icons.class_),
              title: Text('Kelas'),
              subtitle: Text(
                '11 PPLG 1',
                style: TextStyle(color: Color.fromARGB(255, 48, 125, 50)),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.numbers),
              title: Text('Absen'),
              subtitle: Text('03'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('Bio Singkat'),
              subtitle: Text('Pelajar SMK Raden Umar Said kelas 11 PPLG 1'),
            ),
            const ListTile(
              leading: Icon(Icons.link),
              title: Text('Tautan'),
              subtitle: Text(
                'Tambah tautan',
                style: TextStyle(color: Color.fromARGB(255, 45, 119, 48)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
