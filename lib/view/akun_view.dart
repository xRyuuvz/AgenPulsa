import 'package:flutter/material.dart';
import 'package:agenpulsa/view/Sign_view.dart'; // Ensure this import is correct

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Back button color set to white
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white), // Edit profile icon color set to white
            onPressed: () {
              // Edit profile action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/oline jkt48 (2).png'), // Add a profile picture or placeholder
              backgroundColor: Colors.grey[700],
            ),
            SizedBox(height: 16),
            Text(
              'dhiksa',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '085609508264',
              style: TextStyle(color: Colors.grey[400], fontSize: 18),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  buildMenuItem(Icons.compare_arrows, "Transaksi", "0"),
                  buildMenuItem(Icons.account_balance_wallet, "Saldo", "Rp 0"),
                  buildMenuItem(Icons.notifications, "Pemberitahuan", ""),
                  buildMenuItem(Icons.favorite, "Produk Favorit", "0"),
                  buildMenuItem(Icons.location_on, "Alamat Pengiriman", "0"),
                  buildMenuItem(Icons.contact_support, "Hubungi CS", ""),
                  buildMenuItem(Icons.storefront, "Spanduk Kios", ""),
                  buildMenuItem(Icons.verified_user, "Verifikasi Data Diri (KYC)", ""),
                  buildMenuItem(Icons.settings, "Pengaturan", ""),
                  buildMenuItem(Icons.exit_to_app, "Keluar", "", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, String trailingText, [BuildContext? context]) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white), // Icon color set to white
          title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          trailing: trailingText.isNotEmpty
              ? Text(trailingText, style: TextStyle(color: Colors.grey[400]))
              : null,
          onTap: () {
            if (title == "Keluar" && context != null) {
              _showLogoutDialog(context);
            } else {
              // Handle other menu item taps
            }
          },
        ),
        Divider(
          color: Colors.grey[800],
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text("Konfirmasi Keluar", style: TextStyle(color: Colors.white)),
          content: Text("Apakah Anda yakin ingin keluar?", style: TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              child: Text("Batal", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Keluar", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Navigate to LoginPage
              },
            ),
          ],
        );
      },
    );
  }
}
