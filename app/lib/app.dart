import 'package:app/screens/identifying/identifying.dart';
import 'package:app/screens/image_review/image_review.dart';
import 'package:app/screens/pest_and_disease_detail/pest_and_disease_detail.dart';
import 'package:app/screens/pests_and_diseases/bloc/pests_and_diseases_bloc.dart';
import 'package:app/screens/pests_and_diseases/pests_and_diseases.dart';
import 'package:app/screens/plant_detail/plant_detail.dart';
import 'package:app/screens/plants/bloc/plants_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/plants/plants.dart';
import 'package:app/screens/insect/insect.dart';
import 'package:app/screens/profile/profile.dart';
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
                  path: RoutesPath.plantsRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Plants()),
                ),
                GoRoute(
                  path: RoutesPath.pestsAndDiseasesRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: PestsAndDiseases()),
                ),
                GoRoute(
                  path: RoutesPath.profileRoute,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Profile()),
                )
              ]),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.plantDetailRoute,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: PlantDetail())),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.pestAndDiseaseDetailRoute,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: PestAndDiseaseDetail())),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.loginRoute,
              pageBuilder: ((context, state) =>
                  const MaterialPage(child: LoginScreen()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.registerRoute,
              pageBuilder: ((context, state) =>
                  const MaterialPage(child: Register()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.otpVerificationRoute,
              pageBuilder: ((context, state) =>
                  const MaterialPage(child: OtpVerification()))),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.settingRoute,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: Setting())),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: '${RoutesPath.imageCaptureRoute}/:type',
              name: RoutesPath.imageCaptureRoute,
              pageBuilder: (context, state) {
                final cameras = state.extra as List<CameraDescription>;
                final type = int.parse(state.params['type'] as String);
                return MaterialPage(
                    child: ImageCapture(cameras: cameras, type: type));
              }),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.imageReviewRoute,
              pageBuilder: (context, state) {
                final pictureFilePath = state.extra as String;
                return MaterialPage(
                    child: ImageReview(
                  pictureFilePath: pictureFilePath,
                ));
              }),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesPath.identifyingRoute,
              pageBuilder: (context, state) {
                final pictureFilePath = state.extra as String;
                return MaterialPage(
                    child: Identifying(
                  pictureFilePath: pictureFilePath,
                ));
              })
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                PlantsBloc()..add(GetPlantsEvent())),
        BlocProvider(
            create: (BuildContext context) =>
                PestsAndDiseasesBloc()..add(GetDiseasesEvent()))
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245)),
        routerConfig: goRouter,
      ),
    );
  }
}
