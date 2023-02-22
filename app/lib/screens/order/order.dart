import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with TickerProviderStateMixin {
  late final _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xfff05222),
              unselectedLabelColor: const Color(0xff7f8c8d),
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              indicatorColor: const Color(0xfff05222),
              tabs: const [
                Tab(height: 50, text: 'Đang giao'),
                Tab(text: 'Lịch sử'),
                Tab(text: 'Đánh giá'),
                Tab(text: 'Đơn nháp'),
              ],
            ),
          )),
    );
  }
}
