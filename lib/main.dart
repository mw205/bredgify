import 'package:bridgefy/core/routes/app_router.dart';
import 'package:bridgefy/core/utils/simple_observer.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:bridgefy/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleObserver();
  runApp(const Bridgefy());
}

class Bridgefy extends StatelessWidget {
  const Bridgefy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: AppRouter.goRouter.routeInformationParser,
          routerDelegate: AppRouter.goRouter.routerDelegate,
          routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              scrolledUnderElevation: 0,
            ),
            fontFamily: FontFamily.poppins,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: ColorName.darkBlue.withOpacity(0.5),
              selectionHandleColor: ColorName.darkBlue,
            ),
          ),
        );
      },
    );
  }
}
