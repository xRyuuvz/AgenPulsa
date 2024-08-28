import 'package:flutter/material.dart';

class SaldoPage extends StatefulWidget {
  @override
  _SaldoPageState createState() => _SaldoPageState();
}

class _SaldoPageState extends State<SaldoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SaldoSummary(),
          SizedBox(height: 16),
          Expanded(child: TabBarViewSection()),
        ],
      ),
    );
  }
}

class SaldoSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 42, 42),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.account_balance_wallet, color: Colors.white, size: 32),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saldo Akun',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp 0',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    elevation: 2,
                  ),
                  child: Text('Transfer Saldo', style: TextStyle(color: const Color.fromARGB(255, 214, 42, 42), fontSize: 16)),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    elevation: 2,
                  ),
                  child: Text('Tambah Saldo', style: TextStyle(color: const Color.fromARGB(255, 214, 42, 42), fontSize: 16)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: const Color.fromARGB(255, 214, 42, 42),
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: const Color.fromARGB(255, 214, 42, 42),
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'SEMUA'),
                Tab(text: 'DEBET'),
                Tab(text: 'KREDIT'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Use a Container to ensure that no horizontal scrolling is allowed
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Center(child: Text('Tidak ada riwayat saldo.', style: TextStyle(color: Colors.grey[600]))),
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Center(child: Text('Tidak ada debet.', style: TextStyle(color: Colors.grey[600]))),
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Center(child: Text('Tidak ada kredit.', style: TextStyle(color: Colors.grey[600]))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
