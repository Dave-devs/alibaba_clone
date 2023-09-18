import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/constants/utils/on_gen_route.dart';
import 'package:alibaba_clone/presentation/authentication/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final Stream<dynamic>? stream;
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 725),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
              title: 'Alibaba Clone',
              debugShowCheckedModeBanner: false,
              theme: FlexThemeData.light(
                useMaterial3: true,
                primary: lPryClr,
                primaryContainer: lPryConClr,
                onPrimary: onBg,
                onError: onBg,
                secondary: lSecClr,
                secondaryContainer: lSecConClr,
                tertiary: lTerClr,
                tertiaryContainer: lTerConClr,
                error: lErrClr,
                blendLevel: 20,
                appBarOpacity: 0.95,
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                fontFamily: GoogleFonts.roboto().fontFamily,
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                tabBarStyle: FlexTabBarStyle.forBackground,
                subThemesData: const FlexSubThemesData(
                    blendOnLevel: 20,
                    blendOnColors: false,
                    inputDecoratorIsFilled: false),
                useMaterial3ErrorColors: true,
              ).copyWith(
                brightness: Brightness.light,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                backgroundColor: lAppBarClr, elevation: 0)
              ),
              darkTheme: FlexThemeData.dark(
                useMaterial3: true,
                primary: dPryClr,
                primaryContainer: dPryConClr,
                onPrimary: onBg,
                onError: onBg,
                secondary: dSecClr,
                secondaryContainer: dSecConClr,
                tertiary: dTerClr,
                tertiaryContainer: dTerConClr,
                appBarBackground: dAppBarClr,
                error: dErrClr,
                surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
                blendLevel: 15,
                appBarStyle: FlexAppBarStyle.background,
                appBarOpacity: 0.90,
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                fontFamily: GoogleFonts.roboto().fontFamily,
                tabBarStyle: FlexTabBarStyle.forBackground,
                subThemesData: const FlexSubThemesData(
                    blendOnLevel: 30, inputDecoratorIsFilled: false),
              ).copyWith(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(0xFF252525),
                appBarTheme: const AppBarTheme(
                  backgroundColor: dAppBarClr, elevation: 0)
              ),
              themeMode: ThemeMode.system,
              onGenerateRoute: onGenerateRoute,
              home: const LoginPage()
            );
        });
  }
}


// StreamBuilder(
//               stream: stream,
//               builder: (_, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: whyt,
//                     ),
//                   );
//                 }

//                 if (snapshot.connectionState == ConnectionState.active) {
//                   if (snapshot.hasData) {
//                     return const ScreenLayoutDimension(webScreen: WebScreen(), mobileScreen: MobieScreen());
//                   }

//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('${snapshot.error}'),
//                     );
//                   }
//                 }

//                 return const LoginPage();
//               }
//             ),