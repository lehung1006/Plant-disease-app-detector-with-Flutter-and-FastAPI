import 'package:app/models/history_item.dart';
import 'package:app/screens/identify_history/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';

class IdentifyHistory extends StatefulWidget {
  const IdentifyHistory({super.key});

  static DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  State<IdentifyHistory> createState() => _IdentifyHistoryState();
}

class _IdentifyHistoryState extends State<IdentifyHistory> {
  late final HistoryItem historyItem;

  @override
  void initState() {
    // TODO: implement initState
    historyItem = HistoryItem(
        title: 'Dừa cạn',
        subTitle:
            'Dừa cạn là cây thân thảo hoặc cây bụi nhỏ thường xanh, cao tới 1m',
        date:
            '${IdentifyHistory.date.day.toString()}/${IdentifyHistory.date.month.toString()}/${IdentifyHistory.date.year.toString()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Lịch sử nhận diện',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: 20,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) =>
              HistoryItemWidget(historyItem: historyItem),
        ));
  }
}
