import 'package:flutter/material.dart';
import 'package:app/widgets/item.dart';

class Plants extends StatefulWidget {
  const Plants({super.key});

  @override
  State<Plants> createState() => _OrderState();
}

class _OrderState extends State<Plants> with TickerProviderStateMixin {
  late final _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  String title = 'Táo';
  String subTitle =
      'Cam là quả của nhiều loài cây có múi khác nhau thuộc họ Cửu lý hương (Rutaceae) (xem danh sách các loài thực vật được gọi là cam)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Cây cối',
              style: TextStyle(color: Color(0xff2ecc71)))),
      body: ListView.separated(
        itemCount: 15,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) {
          return Item(title: title, subTitle: subTitle);
        },
      ),
    );
  }
}
