import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/app_bar.dart';
import 'package:online_shop/presentation/settings/widgets/my_orders_tile.dart';
import 'package:online_shop/presentation/settings/pages/logout_page.dart';

import '../widgets/my_favorties_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // My Favorites Tile
            ListTile(
              title: const Text('My Favorites'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman favorit
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            const SizedBox(height: 15),

            // My Orders Tile
            ListTile(
              title: const Text('My Orders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman pesanan
                Navigator.pushNamed(context, '/orders');
              },
            ),
            const SizedBox(height: 15),

            // Logout Tile
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                // Menampilkan dialog konfirmasi logout
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Aksi logout
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false, // Hapus semua route sebelumnya
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
