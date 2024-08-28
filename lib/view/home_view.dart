import 'package:agenpulsa/view/Bulanan.dart';
import 'package:agenpulsa/view/Catatan.dart';
import 'package:agenpulsa/view/Indihome.dart';
import 'package:agenpulsa/view/Masa%20aktif.dart';
import 'package:agenpulsa/view/PDAM.dart';
import 'package:agenpulsa/view/PLN.dart';
import 'package:agenpulsa/view/SaldoPage.dart';
import 'package:agenpulsa/view/SmsView.dart';
import 'package:agenpulsa/view/Transaksi.dart';
import 'package:agenpulsa/view/tokenpln.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:agenpulsa/view/PulsaView.dart';
import 'package:agenpulsa/view/PaketInternet.dart';
import 'package:agenpulsa/view/Telepon.dart';
import 'package:agenpulsa/widget/HomeWidget.dart';
import 'package:agenpulsa/theme/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onBottomBarTap(int index) {
    if (index == 4) {
      _showMoreOptionsDialog();
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.jumpToPage(index);
    }
  }

  void _showMoreOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Lainnya",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite, // Makes the dialog content take up the full width
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _dialogOption(
                  icon: Icons.person,
                  title: "Profil",
                  onTap: () {
                    Navigator.of(context).pop();
                    // Handle Profil navigation here
                  },
                ),
                SizedBox(height: 16),
                _dialogOption(
                  icon: Icons.phone,
                  title: "Hubungi",
                  onTap: () {
                    Navigator.of(context).pop();
                    // Handle Hubungi navigation here
                  },
                ),
                SizedBox(height: 16),
                _dialogOption(
                  icon: Icons.ad_units,
                  title: "Spanduk",
                  onTap: () {
                    Navigator.of(context).pop();
                    // Handle Spanduk navigation here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dialogOption({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12), // Adjust vertical padding
        child: Row(
          children: <Widget>[
            Icon(icon, size: 30, color: Colors.black),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    List<Map> dailyTopUpList = [
      {
        'icon': Icons.phone_android,
        'title': "Pulsa",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Pulsaview(),
            ),
          );
        },
      },
      {
        'icon': Icons.wifi,
        'title': "Paket Internet",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Paketinternet(),
            ),
          );
        },
      },
      {
        'icon': Icons.phone,
        'title': "Paket Telp",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeleponTelkomsel(),
            ),
          );
        },
      },
      {
        'icon': Icons.messenger,
        'title': "Paket SMS",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SMSView(),
            ),
          );
        },
      },
      {
        'icon': Icons.lightbulb,
        'title': "Token PLN",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TokenPln(),
            ),
          );
        },
      },
      {
        'icon': Icons.sim_card,
        'title': "Masa Aktif",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Masaaktif(),
            ),
          );
        },
      },
    ];

    List<Map> billPaymentList = [
      {
        'icon': Icons.lightbulb,
        'title': "PLN",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Pln(),
            ),
          );
        },
      },
      {
        'icon': Icons.satellite,
        'title': "Indihome",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Indihome(),
            ),
          );
        },
      },
      {
        'icon': Icons.wifi,
        'title': "Internet Bulanan",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InternetBulanan(),
            ),
          );
        },
      },
      {
        'icon': Icons.water_damage,
        'title': "PDAM",
        'action': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDAM(),
            ),
          );
        },
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(_selectedIndex, context),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(), // Disable horizontal scrolling
        children: [
          HomeContent(
            themeProvider: themeProvider,
            dailyTopUpList: dailyTopUpList,
            billPaymentList: billPaymentList,
          ),
          TransaksiPage(), // Replace with your page
          SaldoPage(),
          CatatanHutangPage(), // Replace with your page
          Container(color: Colors.yellow), // Replace with your page
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: _onBottomBarTap,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: const Color.fromARGB(255, 214, 42, 42),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.article_rounded),
              title: Text("Transaksi"),
              selectedColor: const Color.fromARGB(255, 214, 42, 42),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text("Saldo"),
              selectedColor: const Color.fromARGB(255, 214, 42, 42),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.note),
              title: Text("Catatan"),
              selectedColor: const Color.fromARGB(255, 214, 42, 42),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.apps_sharp),
              title: Text("Lainnya"),
              selectedColor: const Color.fromARGB(255, 214, 42, 42),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(int index, BuildContext context) {
    switch (index) {
      case 0: // Home
        return AppBar(
          automaticallyImplyLeading: false, // Remove the leading back button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi, (username)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Add navigation action here
                },
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "0 Trx",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 214, 42, 42),
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
      case 1: // Transaksi
        return AppBar(
          automaticallyImplyLeading: false, // Remove the leading back button
          title: Text(
            "Transaksi",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 214, 42, 42),
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
      case 2: // Saldo
        return AppBar(
          automaticallyImplyLeading: false, // Remove the leading back button
          title: Text("Saldo"),
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
      case 3: // Catatan
        return AppBar(
          automaticallyImplyLeading: false, // Remove the leading back button
          title: Text("Catatan"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
      case 4: // Lainnya
        return AppBar(
          automaticallyImplyLeading: false, // Remove the leading back button
          title: Text("Lainnya"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
      default:
        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 4.0, // Add shadow here
          shadowColor: Colors.black.withOpacity(0.5), // Customize shadow color
        );
    }
  }
}
