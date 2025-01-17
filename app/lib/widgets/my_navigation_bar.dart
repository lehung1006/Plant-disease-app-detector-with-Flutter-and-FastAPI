import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../router/routes.dart';
import 'my_floating_action_button/my_floating_action_button.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key, required this.child});

  final Widget child;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  static final tabs = [
    MyNavigationBarItem(
        label: 'Diễn đàn',
        initLocation: RoutesPath.homeRoute,
        icon: const FaIcon(FontAwesomeIcons.house)),
    MyNavigationBarItem(
      label: 'Thực vật',
      initLocation: RoutesPath.plantsRoute,
      icon: const FaIcon(FontAwesomeIcons.plantWilt),
    ),
    MyNavigationBarItem(
      label: 'Sâu bệnh',
      initLocation: RoutesPath.pestsAndDiseasesRoute,
      icon: const FaIcon(FontAwesomeIcons.disease),
    ),
    MyNavigationBarItem(
        label: 'Tôi',
        initLocation: RoutesPath.profileRoute,
        icon: const FaIcon(FontAwesomeIcons.user),
        activeIcon: const FaIcon(FontAwesomeIcons.solidUser))
  ];

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => (location.startsWith(t.initLocation)));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButton: const MyFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff2ecc71),
        iconSize: 20.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}

class MyNavigationBarItem extends BottomNavigationBarItem {
  const MyNavigationBarItem(
      {required this.initLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon);

  final String initLocation;
}
