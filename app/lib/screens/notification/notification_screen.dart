import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông báo', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.gear,
                    color: Color(0xffbdc3c7)))
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                color: const Color(0xff95a5a6),
                height: 1,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: const [
                    NotificationItem(
                        icon: FontAwesomeIcons.tags,
                        iconColor: Color(0xfff1c40f),
                        label: 'Khuyến mãi',
                        path: ''),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    NotificationItem(
                        icon: FontAwesomeIcons.newspaper,
                        iconColor: Color(0xffeb4d4b),
                        label: 'Tin tức',
                        path: ''),
                  ],
                )),
            const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Cập nhật quan trọng',
                  style: TextStyle(fontSize: 15, color: Color(0xff7f8c8d)),
                )),
            Expanded(
                child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.fileInvoiceDollar,
                        size: 90, color: Color.fromARGB(255, 243, 87, 39)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Thông tin đơn hàng sẽ được cập nhật tại đây',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff7f8c8d)))
                  ]),
            ))
          ],
        ));
  }
}
