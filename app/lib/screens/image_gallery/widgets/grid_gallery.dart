import 'dart:convert';

import 'package:app/router/routes.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridGallery extends StatefulWidget {
  final ScrollController scrollCtr;

  const GridGallery({
    super.key,
    required this.scrollCtr,
  });

  @override
  State<GridGallery> createState() => _GridGalleryState();
}

class _GridGalleryState extends State<GridGallery> {
  final List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      List<AssetEntity> media = await albums[0]
          .getAssetListPaged(size: 60, page: currentPage); //preloading files
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(
                const ThumbnailSize(200, 200)), //resolution of thumbnail
            builder:
                (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (asset.type == AssetType.image) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Stack(children: [
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                          child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => asset.originBytes.then((value) => context
                              .pushNamed(RoutesPath.identificationRoute,
                                  params: {'img': base64Encode(value!)})),
                        ),
                      ))
                    ]),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return false;
      },
      child: _mediaList.isNotEmpty
          ? GridView.builder(
              controller: widget.scrollCtr,
              itemCount: _mediaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return _mediaList[index];
              })
          : const Center(
              child: CircularProgressIndicator(
              color: Color(0xff2ecc71),
            )),
    );
  }
}
