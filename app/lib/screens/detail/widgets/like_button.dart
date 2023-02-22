import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.isLiked});

  final bool isLiked;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked;

  @override
  void initState() {
    // TODO: implement initState
    isLiked = widget.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: isLiked
            ? const FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red)
            : const FaIcon(FontAwesomeIcons.heart, color: Color(0xff95a5a6)),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
        });
  }
}
