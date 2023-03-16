import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_carousel.dart';

class PestAndDiseaseDetail extends StatelessWidget {
  const PestAndDiseaseDetail({super.key});
  static const imageAssets = [
    'lib/images/orange.jpg',
    'lib/images/apple.jpg',
  ];

  static const TextStyle _labelStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  static const _textStyle = TextStyle(fontSize: 16, color: Color(0xff2d3436));

  static Map<String, String> symptoms = {
    'Environmental changes':
        'Environmental damage or dramatic drops in temperature will cause stress to the plant, causing wilt. Some hardy plants can survive subzero temperature, while orthers struggle anywhere below 50 degrees Fahrenheit (10 degrees Celsius). Flowers are no exception, and many species are especially sentitive to cold temperature and dramatic fluctuations in weather. Slightly cold weather can become deadly to few sntitive varieties, but very cold weather will cause most non-woody plant cells to freeze, and lead to sporadic damage due to quick thaws.',
    'Normal end of life cycle':
        "You may notice flowers or parts of leaves start to wither and dry up near the end of the season before cold weather comes. It's disappointing to see, but this is simply because the plant is nearing the end of its natural life cycle. This is especially true if you notice the plant is producing seeds."
  };

  static Map<String, String> solutions = {
    'Environmental changes':
        'Environmental damage or dramatic drops in temperature will cause stress to the plant, causing wilt. Some hardy plants can survive subzero temperature, while orthers struggle anywhere below 50 degrees Fahrenheit (10 degrees Celsius). Flowers are no exception, and many species are especially sentitive to cold temperature and dramatic fluctuations in weather. Slightly cold weather can become deadly to few sntitive varieties, but very cold weather will cause most non-woody plant cells to freeze, and lead to sporadic damage due to quick thaws.',
    'Normal end of life cycle':
        "You may notice flowers or parts of leaves start to wither and dry up near the end of the season before cold weather comes. It's disappointing to see, but this is simply because the plant is nearing the end of its natural life cycle. This is especially true if you notice the plant is producing seeds."
  };

  static Map<String, String> preventions = {
    'Environmental changes':
        'Environmental damage or dramatic drops in temperature will cause stress to the plant, causing wilt. Some hardy plants can survive subzero temperature, while orthers struggle anywhere below 50 degrees Fahrenheit (10 degrees Celsius). Flowers are no exception, and many species are especially sentitive to cold temperature and dramatic fluctuations in weather. Slightly cold weather can become deadly to few sntitive varieties, but very cold weather will cause most non-woody plant cells to freeze, and lead to sporadic damage due to quick thaws.',
    'Normal end of life cycle':
        "You may notice flowers or parts of leaves start to wither and dry up near the end of the season before cold weather comes. It's disappointing to see, but this is simply because the plant is nearing the end of its natural life cycle. This is especially true if you notice the plant is producing seeds."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        CustomAppBar(imgs: const [], context: context),
        SliverToBoxAdapter(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                  'Flowers may dry out due to sudden change in environment or because the plant has completed its normal flowering period',
                  style: _textStyle),
            ),
            CustomContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Symptom', style: _labelStyle),
                const SizedBox(height: 15),
                const Text(
                  'Your plants are brown and withering away on part or whole flowers. This is most likely caused by one or more of the following reason',
                  style: _textStyle,
                ),
                const SizedBox(height: 15),
                for (var e in symptoms.entries) ...[
                  RichText(
                      text: TextSpan(style: _textStyle, children: [
                    TextSpan(
                        text: '${e.key}: ',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: e.value)
                  ])),
                  const SizedBox(height: 15)
                ],
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'lib/images/orange.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
            const Divider(height: 1, thickness: 1),
            CustomContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Solutions', style: _labelStyle),
                const SizedBox(height: 15),
                const Text(
                  'Your plants are brown and withering away on part or whole flowers. This is most likely caused by one or more of the following reason',
                  style: _textStyle,
                ),
                const SizedBox(height: 15),
                for (var e in solutions.entries) ...[
                  RichText(
                      text: TextSpan(style: _textStyle, children: [
                    TextSpan(
                        text: '${e.key}: ',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: e.value)
                  ])),
                  const SizedBox(height: 15)
                ],
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'lib/images/orange.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
            const Divider(height: 1, thickness: 1),
            CustomContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Prevention', style: _labelStyle),
                const SizedBox(height: 15),
                const Text(
                  'Your plants are brown and withering away on part or whole flowers. This is most likely caused by one or more of the following reason',
                  style: _textStyle,
                ),
                const SizedBox(height: 15),
                for (var e in preventions.entries) ...[
                  RichText(
                      text: TextSpan(style: _textStyle, children: [
                    TextSpan(
                        text: '${e.key}: ',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: e.value)
                  ])),
                  const SizedBox(height: 15)
                ],
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'lib/images/orange.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ))
          ]),
        )
      ]),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: child);
  }
}
