import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pulsaview extends StatelessWidget {
  const Pulsaview({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tfPhoneNumberController = TextEditingController();
    List<Map<String, String>> list = [
      {'title': 'Telkomsel 5.000', 'expired': '7', 'price': '5.000'},
      {'title': 'Telkomsel 10.000', 'expired': '15', 'price': '10.000'},
      {'title': 'Telkomsel 15.000', 'expired': '20', 'price': '15.000'},
      {'title': 'Telkomsel 20.000', 'expired': '30', 'price': '20.000'},
      {'title': 'Telkomsel 25.000', 'expired': '30', 'price': '25.000'},
      {'title': 'Telkomsel 50.000', 'expired': '45', 'price': '50.000'},
      {'title': 'Telkomsel 100.000', 'expired': '60', 'price': '100.000'},
      {'title': 'Telkomsel 150.000', 'expired': '90', 'price': '150.000'},
      {'title': 'Telkomsel 200.000', 'expired': '90', 'price': '200.000'},
      {'title': 'Telkomsel 300.000', 'expired': '90', 'price': '300.000'},
      {'title': 'Telkomsel 500.000', 'expired': '90', 'price': '500.000'},
      {'title': 'Telkomsel 1.000.000', 'expired': '90', 'price': '1.000.000'},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Pulsa",
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
                fillColor: Colors.white, // Set the background color to white
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Restricts input to digits only
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Pulsa",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage('lib/images/icon-telkomsel-terbaru.png'),
                      width: 24, // Adjust the size as needed
                      height: 24,
                    ),
                    SizedBox(width: 8), // Adjust spacing between image and text
                    Text(
                      "Telkomsel",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 214, 42, 42),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey, thickness: 1.5),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: itemDetail(
                    context: context,
                    title: list[index]['title']!,
                    expired: list[index]['expired']!,
                    price: list[index]['price']!,
                    controller: tfPhoneNumberController,
                  ),
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
          ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Handphone harus diisi")))
          : showBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                    "Pulsa",
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
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 42, 42),
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
                  width: 24, // Adjust the size as needed
                  height: 24,
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
                color: Color.fromARGB(255, 214, 42, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
