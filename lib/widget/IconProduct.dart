import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6, // Increased elevation for a more prominent shadow
        shadowColor: Colors.black.withOpacity(0.2), // Shadow color
        child: SizedBox(
          height: 110, // Fixed height to ensure alignment
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 214, 42, 42),
                  radius: 24,
                  child: Icon(
                    icon,
                    size: 24,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              const SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
