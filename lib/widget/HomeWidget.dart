import 'package:flutter/material.dart';
import 'package:agenpulsa/widget/IconProduct.dart';
import 'package:agenpulsa/theme/theme_provider.dart';
import 'package:agenpulsa/widget/SaldoCard.dart';
import 'package:agenpulsa/widget/ServiceCard.dart';

class HomeContent extends StatelessWidget {
  final ThemeProvider themeProvider;
  final List<Map> dailyTopUpList;
  final List<Map> billPaymentList;

  const HomeContent({
    Key? key,
    required this.themeProvider,
    required this.dailyTopUpList,
    required this.billPaymentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SaldoCard(
            isDarkMode: themeProvider.isDarkMode,
            saldo: 500000,
          ),
          const SizedBox(height: 13),
          ServiceCard(
            title: "Punya Kendala?",
            subtitle: "Kamu bisa menghubungi tim\ncustomer service kami",
            icon: Icons.support_agent,
            iconColor: const Color.fromARGB(255, 214, 42, 42),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8), // Adjust padding to match the ServiceCard
            child: Text(
              "Isi Ulang Sehari-hari",
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1,
            indent: 8, // Align the divider with the text
            endIndent: 8, // Align the divider with the text
          ),
          const SizedBox(height: 12),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
            shrinkWrap: true, // Take only the space needed
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 116, // Adjusted width for better fitting
              childAspectRatio: 1.0, // Set aspect ratio to ensure consistent height
              crossAxisSpacing: 12,
              mainAxisSpacing: 12, // Adjusted spacing for better layout
            ),
            itemCount: dailyTopUpList.length,
            itemBuilder: (context, index) {
              final item = dailyTopUpList[index];
              return ProductCard(
                icon: item['icon'],
                label: item['title'],
                onTap: item['action'] ?? () {
                  // Default action or handle missing action
                  print('Tapped on ${item['title']}');
                },
              );
            },
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8), // Adjust padding to match the ServiceCard
            child: Text(
              "Product Tagihan",
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1,
            indent: 8, // Align the divider with the text
            endIndent: 8, // Align the divider with the text
          ),
          const SizedBox(height: 12),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
            shrinkWrap: true, // Take only the space needed
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 116, // Adjusted width for better fitting
              childAspectRatio: 1.0, // Set aspect ratio to ensure consistent height
              crossAxisSpacing: 12,
              mainAxisSpacing: 12, // Adjusted spacing for better layout
            ),
            itemCount: billPaymentList.length,
            itemBuilder: (context, index) {
              final item = billPaymentList[index];
              return ProductCard(
                icon: item['icon'],
                label: item['title'],
                onTap: item['action'] ?? () {
                  // Default action or handle missing action
                  print('Tapped on ${item['title']}');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
