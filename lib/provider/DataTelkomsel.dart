import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Datatelkomsel extends StatelessWidget {
  const Datatelkomsel({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tfPhoneNumberController = TextEditingController();
    List<Map<String, String>> list = [
      {'title': 'Telkomsel 1GB', 'expired': '30', 'price': '15.000'},
      {'title': 'Telkomsel 2GB', 'expired': '30', 'price': '25.000'},
      {'title': 'Telkomsel 5GB', 'expired': '30', 'price': '40.000'},
      {'title': 'Telkomsel 10GB', 'expired': '30', 'price': '70.000'},
      {'title': 'Telkomsel 15GB', 'expired': '30', 'price': '90.000'},
      {'title': 'Telkomsel 20GB', 'expired': '30', 'price': '110.000'},
      {'title': 'Telkomsel 30GB', 'expired': '30', 'price': '150.000'},
    ];


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Telkomsel",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tfPhoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Masukkan nomor handphone',
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Paket Internet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage('lib/images/icon-telkomsel-terbaru.png'),
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 232, 36, 36),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey, thickness: 1.5),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 3.5 / 2.5, // Adjusts the height of the grid items
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) => itemDetail(
                  context: context,
                  title: list[index]['title']!,
                  expired: list[index]['expired']!,
                  price: list[index]['price']!,
                  controller: tfPhoneNumberController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDetail({
    required BuildContext context,
    required String title,
    required String expired,
    required String price,
    required TextEditingController controller,
  }) {
    return GestureDetector(
      onTap: () => controller.text == ""
          ? ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No Handphone harus diisi")),
      )
          : showBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Rincian Transaksi",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jenis Produk",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Paket Internet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Provider",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Telkomsel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Harga",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp.$price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "No Handphone",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    controller.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp.$price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 213, 52, 43),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Bayar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('lib/images/icon-telkomsel-terbaru.png'),
                  width: 26,
                  height: 26,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Masa aktif berlaku $expired hari",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp.$price",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
