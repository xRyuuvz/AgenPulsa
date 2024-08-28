import 'package:agenpulsa/view/akun_view.dart';
import 'package:agenpulsa/widget/IconButton.dart';
import 'package:flutter/material.dart';
// Import the account page

class SaldoCard extends StatelessWidget {
  final bool isDarkMode;
  final double saldo;

  const SaldoCard({
    Key? key,
    required this.isDarkMode,
    required this.saldo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: isDarkMode
                          ? Colors.white
                          : theme.colorScheme.inversePrimary,
                      size: 30,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "SALDO MITRA",
                      style: TextStyle(
                        color: isDarkMode
                            ? Colors.white
                            : theme.colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "ISI SALDO" tap
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.9,
                        color: const Color.fromARGB(255, 214, 42, 42),
                      ),
                    ),
                    child: Text(
                      "ISI SALDO",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 214, 42, 42),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              "Rp.${saldo.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 18,
                color: theme.colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonWithLabel(
                  icon: Icons.account_circle,
                  label: 'Akun',
                  onTap: () {
                    // Navigate to the account page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ProfilePage(),
                      ),
                    );
                  },
                ),
                IconButtonWithLabel(
                  icon: Icons.help_outline,
                  label: 'Bantuan',
                  onTap: () {
                    // Handle bantuan button tap
                  },
                ),
                IconButtonWithLabel(
                  icon: Icons.attach_money_sharp,
                  label: 'Tarik',
                  onTap: () {
                    // Handle tarik button tap
                  },
                ),
                IconButtonWithLabel(
                  icon: Icons.qr_code,
                  label: 'Barcode',
                  onTap: () {
                    // Handle barcode button tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
