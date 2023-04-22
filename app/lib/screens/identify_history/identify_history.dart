import 'package:app/models/history_item.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/screens/identify_history/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IdentifyHistory extends StatefulWidget {
  const IdentifyHistory({super.key});

  @override
  State<IdentifyHistory> createState() => _IdentifyHistoryState();
}

class _IdentifyHistoryState extends State<IdentifyHistory> {
  List<HistoryItem>? historyList;

  @override
  void initState() {
    // TODO: implement initState
    context.read<IdentificationBloc>().add(GetIdentifyHistoryListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Lịch sử nhận diện',
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<IdentificationBloc>().add(ClearAllHistoryEvent());
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: BlocListener<IdentificationBloc, IdentificationState>(
        listener: (context, state) {
          if (state is GetIdentifyHistoryListSuccess) {
            setState(() {
              historyList = state.historyList;
            });
          }
        },
        child: historyList != null
            ? historyList!.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: historyList!.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) =>
                        HistoryItemWidget(historyItem: historyList![index]),
                  )
                : const Center(child: Text('Bạn chưa có lịch sử'))
            : const Center(
                child: CircularProgressIndicator(
                color: Color(0xff2ecc71),
              )),
      ),
    );
  }
}
