import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: [
          ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('lib/images/avatar.jpg')),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Lê Hưng',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('3 giờ', style: TextStyle(color: Color(0xff7f8c8d)))
                  ])),
          const Text(
              'Typically used with a users profile image, or, in the absence of such an image, the users initials. A given users initials should always be paired with the same background color, for consistency.'),
          const SizedBox(height: 10),
          Image.asset('lib/images/khuyenmai.jpg'),
          const SizedBox(height: 20),
          const Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                        onTap: () {
                          print('Like');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.thumbsUp,
                                color: Color(0xff7f8c8d)),
                            SizedBox(width: 7),
                            Text('Thích',
                                style: TextStyle(color: Color(0xff7f8c8d)))
                          ],
                        ))),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          print('Comment');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.comment,
                                color: Color(0xff7f8c8d)),
                            SizedBox(width: 7),
                            Text('Bình luận',
                                style: TextStyle(color: Color(0xff7f8c8d)))
                          ],
                        ))),
              ],
            ),
          )
        ]));
  }
}
