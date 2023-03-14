import 'package:app/router/routes.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import './widgets/custom_list_tile.dart';
import './widgets/characteristic_item.dart';

class PlantDetail extends StatelessWidget {
  const PlantDetail({super.key});

  static const imageAssets = [
    'lib/images/orange.jpg',
    'lib/images/apple.jpg',
  ];

  static String title = 'Sâu cuốn lá';
  static String subTitle =
      'Sâu cuốn lá hay sâu ăn lá gây hại chủ yếu trên các loại cây họ dưa, bầu bí, cà chua và một số loại rau xanh, cây ăn quả, lúa,';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(imageAssets: imageAssets, context: context),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomContainer(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ngô',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Row(children: const [
                      Text('Tên khoa học: ',
                          style: TextStyle(
                              color: Color(0xff7f8c8d), fontSize: 16)),
                      Text('Zea mays', style: TextStyle(fontSize: 16))
                    ])
                  ],
                ),
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  children: const [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      horizontalTitleGap: -3,
                      leading: Icon(FontAwesomeIcons.leaf,
                          size: 20, color: Colors.black),
                      title: Text('Mô tả',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Text(
                        'Ngô là lương thực chính cho gần một nửa dân số của Châu Phi cận Sahara và rất quan trọng đối với carbohydrate, protein, sắt, vitamin B và khoáng chất. Sản phẩm được tiêu thụ dưới dạng bột ngô (ugali), cháo, bột nhão và bia, và có thể được luộc hoặc rang ngay khi được lấy từ trang trại. Ngô cũng được chế biến để sản xuất dầu ăn. Nó cũng là một loại cây trồng quan trọng để làm thức ăn chăn nuôi.',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff636e72)))
                  ],
                ),
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Column(
                children: const [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    horizontalTitleGap: -3,
                    leading: Icon(FontAwesomeIcons.circleInfo,
                        size: 20, color: Colors.black),
                    title: Text('Đặc điểm',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  CharacteristicsItem(
                      left: 'Loại cây', right: 'Cây lương thực'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  CharacteristicsItem(left: 'Tuổi thọ', right: '90 - 160 ngày'),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  CharacteristicsItem(
                      left: 'Thời gian nở hoa', right: 'Mùa hè, mùa thu'),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  CharacteristicsItem(left: 'Chiều cao', right: '1 - 4 m'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  CharacteristicsItem(left: 'Lan rộng', right: '30 - 61 cm'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  CharacteristicsItem(
                      left: 'Môi trường sống', right: 'Trồng theo luống')
                ],
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    horizontalTitleGap: -3,
                    leading: Icon(FontAwesomeIcons.plantWilt,
                        size: 20, color: Colors.black),
                    title: Text('Điều kiện sống',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.signal,
                      title: 'Đánh giá độ khó',
                      subTitle:
                          'Ngô không khó chăm sóc. Với sự chăm sóc thích hợp, Ngô của bạn sẽ phát triển tốt trong một số môi trường nhất định.'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.cloudSun,
                      title: 'Ánh sáng mặt trời',
                      subTitle: 'Nắng toàn phần, bán phần'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.temperatureHigh,
                      title: 'Nhiệt độ chịu đựng',
                      subTitle: '-18 \u00B0C'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.mountain,
                      title: 'Đất',
                      subTitle:
                          'Đất mùn, đất sét, cát, đất thịt pha cát, có tính axit, trung tính, hơi kiềm, kiềm vừa phải.'),
                ],
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    horizontalTitleGap: -3,
                    leading: Icon(FontAwesomeIcons.handHolding,
                        size: 20, color: Colors.black),
                    title: Text('Hướng dẫn chăm sóc',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.droplet,
                      title: 'Nước',
                      subTitle:
                          'Một cách tuyệt vời để giữ ẩm cho đất xung quanh ngô là phủ một lớp mùn ngay sau khi trồng. Sau đó tưới nước thường xuyên cho cây bằng phương pháp nhỏ giọt ở gốc cây để nước đến rễ. Khoảng 1 inch hoặc 1,5 inch nước mỗi tuần là một tiêu chuẩn tốt nhưng hệ thống tốt nhất là tưới cây ngay khi lớp đất trên cùng khô đi.'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.sunPlantWilt,
                      title: 'Bón phân',
                      subTitle:
                          'Ngô thích đất hơi chua, vì vậy bạn nên kiểm tra độ pH của đất để xác định loại hóa chất nào sẽ được áp dụng để đạt được sự cân bằng chính xác. Sau đó, tất cả những gì cần thiết là tia phân N-P-K chậm cân đối (tỷ lệ lý tưởng là 10-10-10) trước khi gieo hạt. Bón lại khi cây cao 30 cm nhưng chắc chắn phân không chạm vào cây'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.hourglassStart,
                      title: 'Thời gian trồng',
                      subTitle: 'Đầu mùa xuân'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.hourglassEnd,
                      title: 'Thời gian thu hoạch',
                      subTitle: 'Cuối mùa hè, đầu hoặc giữa mùa thu'),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const CustomListTile(
                      leading: FontAwesomeIcons.seedling,
                      title: 'Nhân giống',
                      subTitle: 'Gieo hạt'),
                ],
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    horizontalTitleGap: -3,
                    leading: Icon(FontAwesomeIcons.bug,
                        size: 20, color: Colors.black),
                    title: Text('Các loại sâu bệnh thường gặp',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      'Sâu bắp ngô (Helicoverpa zea), Sâu bore thân ngô (Papaipema nebris), Rệp lá ngô (Rhopalosiphum maidis), Sâu bore ngô châu Âu (Ostrinia nubilalis), Ruồi râu ngô (Euxesta stigmatis), Sâu bore nhỏ thân ngô (Elasmopalpus lignosellus), Bọ rễ ngô (Diabrotica virgifera virgifera LeConte)',
                      style: TextStyle(fontSize: 16, color: Color(0xff636e72)),
                    ),
                  )
                ],
              )),
              const SizedBox(height: 10),
              CustomContainer(
                  child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    horizontalTitleGap: -3,
                    leading: Icon(FontAwesomeIcons.sackDollar,
                        size: 20, color: Colors.black),
                    title: Text('Sử dụng',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      'Làm lương thực: Sử dụng làm lương thực cho người, dùng nuôi gia cầm và gia súc. Sử dụng trong công nghiệp: chuyển hóa thành chất dẻo hay vải sợi, xăng sinh học, rượu, cồn... Sử dụng trong chế biến thực phẩm thực phẩm: canh ngô, cháo ngô... Làm đồ ăn vặt, bánh...: Bánh đúc ngô, bỏng ngô, bánh bông ngô...',
                      style: TextStyle(fontSize: 16, color: Color(0xff636e72)),
                    ),
                  )
                ],
              )),
              const SizedBox(
                height: 10,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: child);
  }
}
