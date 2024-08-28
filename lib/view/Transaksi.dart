import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color _appBarColor = Colors.blue; // Default color

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          _appBarColor = Colors.red; // Change color when first tab is selected
        } else {
          _appBarColor = Theme.of(context).colorScheme.primary; // Default color for other tabs
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: const Color.fromARGB(255, 214, 42, 42),
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: const Color.fromARGB(255, 214, 42, 42),
              indicatorWeight: 3,
              isScrollable: true,
              tabs: [
                Tab(text: 'SEMUA'),
                Tab(text: 'SUKSES'),
                Tab(text: 'DALAM PROSES'),
                Tab(text: 'MENUNGGU PEMBAYARAN'),
                Tab(text: 'GAGAL'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Add padding to shift content to the left
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Center(child: Text('Semua Transactions', style: TextStyle(color: Colors.grey[600]))),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Center(child: Text('Sukses Transactions', style: TextStyle(color: Colors.grey[600]))),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Center(child: Text('Dalam Proses Transactions', style: TextStyle(color: Colors.grey[600]))),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Center(child: Text('Menunggu Pembayaran Transactions', style: TextStyle(color: Colors.grey[600]))),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Center(child: Text('Gagal Transactions', style: TextStyle(color: Colors.grey[600]))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
