import 'package:flutter/material.dart';

class Insect extends StatelessWidget {
  const Insect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Côn trùng', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 100,
              child: Row(
                children: [
                  Image.asset('lib/images/orange.jpg', fit: BoxFit.contain)
                ],
              ));
        },
      ),
    );
  }
}
