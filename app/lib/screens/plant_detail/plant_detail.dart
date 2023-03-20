import 'package:app/router/routes.dart';
import 'package:app/screens/plant_detail/bloc/plant_detail_bloc.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import './widgets/custom_list_tile.dart';
import './widgets/characteristic_item.dart';

class PlantDetail extends StatelessWidget {
  const PlantDetail({super.key, required this.plantId});

  final String plantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PlantDetailBloc()..add(GetPlantDetailEvent(plantId: plantId)),
      child: BlocListener<PlantDetailBloc, PlantDetailState>(
        listener: (context, state) {
          if (state is GetPlantDetailFailure) {
            showToast(state.e);
          }
        },
        child: Scaffold(
          body: BlocBuilder<PlantDetailBloc, PlantDetailState>(
            builder: (context, state) {
              if (state is GetPlantDetailSuccess) {
                final plant = state.plantDetail;
                return CustomScrollView(
                  slivers: [
                    CustomAppBar(name: plant.name ?? '', imgs: plant.imgs ?? [], context: context),
                    SliverToBoxAdapter(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainer(
                                child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(plant.name ?? '',
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    const Text('Tên khoa học: ',
                                        style: TextStyle(
                                            color: Color(0xff7f8c8d),
                                            fontSize: 16)),
                                    Text(plant.scienceName ?? ' ',
                                        style: const TextStyle(fontSize: 16))
                                  ])
                                ],
                              ),
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                              child: Column(
                                children: [
                                  const ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    horizontalTitleGap: -3,
                                    leading: Icon(FontAwesomeIcons.leaf,
                                        size: 20, color: Colors.black),
                                    title: Text('Mô tả',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text(plant.description ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff636e72)))
                                ],
                              ),
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  horizontalTitleGap: -3,
                                  leading: Icon(FontAwesomeIcons.circleInfo,
                                      size: 20, color: Colors.black),
                                  title: Text('Đặc điểm',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                CharacteristicsItem(
                                    left: 'Loại cây',
                                    right: plant.plantType ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CharacteristicsItem(
                                    left: 'Tuổi thọ',
                                    right: plant.lifeSpan ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CharacteristicsItem(
                                    left: 'Thời gian nở hoa',
                                    right: plant.bloomTime ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CharacteristicsItem(
                                    left: 'Chiều cao',
                                    right: '${plant.plantHeight ?? ""} m'),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CharacteristicsItem(
                                    left: 'Lan rộng',
                                    right: '${plant.spread ?? ""} m'),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CharacteristicsItem(
                                    left: 'Môi trường sống',
                                    right: plant.habitat ?? '')
                              ],
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  horizontalTitleGap: -3,
                                  leading: Icon(FontAwesomeIcons.plantWilt,
                                      size: 20, color: Colors.black),
                                  title: Text('Điều kiện sống',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.signal,
                                    title: 'Đánh giá độ khó',
                                    subTitle: plant.difficultyRating ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.cloudSun,
                                    title: 'Ánh sáng mặt trời',
                                    subTitle: plant.sunlight ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.temperatureHigh,
                                    title: 'Nhiệt độ chịu đựng',
                                    subTitle:
                                        '${plant.hardiness ?? ""} \u00B0C'),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.locationDot,
                                    title: 'Vùng độ cứng',
                                    subTitle: plant.hardinessZone ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.mountain,
                                    title: 'Đất',
                                    subTitle: plant.soil ?? ''),
                              ],
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  horizontalTitleGap: -3,
                                  leading: Icon(FontAwesomeIcons.handHolding,
                                      size: 20, color: Colors.black),
                                  title: Text('Hướng dẫn chăm sóc',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.droplet,
                                    title: 'Nước',
                                    subTitle: plant.water ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.sunPlantWilt,
                                    title: 'Bón phân',
                                    subTitle: plant.fertilization ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.hourglassStart,
                                    title: 'Thời gian trồng',
                                    subTitle: plant.plantingTime ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.hourglassEnd,
                                    title: 'Thời gian thu hoạch',
                                    subTitle: plant.harvestTime ?? ''),
                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                                CustomListTile(
                                    leading: FontAwesomeIcons.seedling,
                                    title: 'Nhân giống',
                                    subTitle: plant.propagation ?? ''),
                              ],
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  horizontalTitleGap: -3,
                                  leading: Icon(FontAwesomeIcons.bug,
                                      size: 20, color: Colors.black),
                                  title: Text('Các loại sâu bệnh thường gặp',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                  child: Text(
                                    plant.pestsDiseases ?? '',
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xff636e72)),
                                  ),
                                )
                              ],
                            )),
                            const SizedBox(height: 10),
                            CustomContainer(
                                child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  horizontalTitleGap: -3,
                                  leading: Icon(FontAwesomeIcons.sackDollar,
                                      size: 20, color: Colors.black),
                                  title: Text('Sử dụng',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                  child: Text(
                                    plant.uses ?? '',
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xff636e72)),
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
                );
              }
              return const Center(
                  child: CircularProgressIndicator(color: Color(0xff2ecc71)));
            },
          ),
        ),
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
