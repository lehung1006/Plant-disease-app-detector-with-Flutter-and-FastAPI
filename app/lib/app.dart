import 'package:app/widgets/app_bloc/app_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/order/order.dart';
import 'package:app/screens/favourite/favourive.dart';
import 'package:app/screens/notification/notification_screen.dart';
import 'package:app/screens/profile/profile.dart';
import 'package:app/screens/detail/detail.dart';
import 'package:app/screens/setting/setting.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/screens/register/register.dart';
import 'package:app/screens/otp-verification/otp_verification.dart';
import 'package:app/screens/image_capture/image_capture.dart';
import './router/routes.dart';
import './widgets/my_navigation_bar.dart';

class MainFlowWidget extends StatefulWidget {
  const MainFlowWidget({super.key});

  @override
  State<MainFlowWidget> createState() => _MainFlowWidgetState();
}

class _MainFlowWidgetState extends State<MainFlowWidget> {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _navBarNavigatorKey = GlobalKey<NavigatorState>();

  // ignore: prefer_typing_uninitialized_variables
  late final goRouter;

  @override
  void initState() {
    // TODO: implement initState
    goRouter = GoRouter(
        initialLocation: RoutesPath.homeRoute,
        navigatorKey: _rootNavigatorKey,
        routes: [
          ShellRoute(
              navigatorKey: _navBarNavigatorKey,
              builder: (context, state, child) {
                return MyNavigationBar(child: child);
              },
              routes: [
                GoRoute(
                  path: RoutesPath.homeRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HomePage()),
                ),
                GoRoute(
                  path: RoutesPath.orderRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Order()),
                ),
                GoRoute(
                  path: RoutesPath.favouriteRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Favourite()),
                ),
                GoRoute(
                  path: RoutesPath.notificationRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: NotificationScreen()),
                ),
                GoRoute(
                  path: RoutesPath.profileRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Profile()),
                )
              ]),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.detailRoute,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Detail())),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.loginRoute,
              pageBuilder: ((context, state) =>
                  const NoTransitionPage(child: LoginScreen()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.registerRoute,
              pageBuilder: ((context, state) =>
                  const NoTransitionPage(child: Register()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.otpVerificationRoute,
              pageBuilder: ((context, state) =>
                  const NoTransitionPage(child: OtpVerification()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.settingRoute,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Setting())),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.imageCaptureRoute,
              pageBuilder: (context, state) {
                final camera = state.extra as CameraDescription;
                return NoTransitionPage(
                    child: ImageCapture(
                  camera: camera,
                ));
              })
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (BuildContext context) => AppBloc()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245)),
        routerConfig: goRouter,
      ),
    );
  }
}
