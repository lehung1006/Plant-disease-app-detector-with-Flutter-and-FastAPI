import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/models/product_detail.dart';
import './widgets/rating.dart';
import '../../repository/repos.dart';
// import '../../network/api_services.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  // final ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    // ProductDetailRepo test = ProductDetailRepoImpl(_apiServices);
    ApiRepository.productDetailRepo.getProductDetail();
    // test.getProductDetail();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft,
                color: Color(0xff7f8c8d)),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          backgroundColor: const Color.fromRGBO(219, 215, 215, 0.0),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('lib/images/burger.jpeg'),
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hamburger',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(height: 10),
                    const Text('Banh mi thit lon ngot nuoc',
                        style: TextStyle(
                          color: Color(0xff7f8c8d),
                          fontSize: 14,
                        )),
                    const Rating(rating: 4, reviews: 1500, isLiked: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '50.000',
                          style: TextStyle(
                              color: Color.fromARGB(255, 243, 87, 39),
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.solidSquarePlus,
                                size: 30,
                                color: Color.fromARGB(255, 243, 87, 39)))
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Divider(thickness: 1, height: 1)),
                    const SizedBox(height: 10),
                    const Text('Bình luận',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff7f8c8d),
                            fontWeight: FontWeight.w500))
                  ],
                ))
          ],
        ));
  }
}
