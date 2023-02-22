import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'like_button.dart';

class Rating extends StatelessWidget {
  const Rating(
      {super.key,
      required this.rating,
      required this.reviews,
      required this.isLiked});

  final double rating;
  final int reviews;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          initialRating: 3.5,
          allowHalfRating: true,
          direction: Axis.horizontal,
          itemCount: 5,
          itemSize: 16,
          itemPadding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          ignoreGestures: true,
          ratingWidget: RatingWidget(
              empty: const FaIcon(FontAwesomeIcons.star, color: Colors.amber),
              half: const FaIcon(FontAwesomeIcons.starHalfStroke,
                  color: Colors.amber),
              full: const FaIcon(FontAwesomeIcons.solidStar,
                  color: Colors.amber)),
          onRatingUpdate: (value) {},
        ),
        Text(rating.toString(), style: const TextStyle(fontSize: 15)),
        const SizedBox(width: 4),
        Text('($reviews+ đánh giá)', style: const TextStyle(fontSize: 15)),
        const Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: LikeButton(
              isLiked: true,
            ),
          ),
        )
      ],
    );
  }
}
