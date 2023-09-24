import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/constants/utils/on_gen_route.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:alibaba_clone/presentation/dimension/layout_buider.dart';
import 'package:alibaba_clone/presentation/mobile_screen/mobile_screen.dart';
import 'package:alibaba_clone/presentation/web_screen/web_screen.dart';
import 'package:alibaba_clone/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserDetails(context, ref);
  }

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
                primary: lprimary,
                onPrimary: lonPrimary,
                primaryContainer: lprimaryContainer,
                onPrimaryContainer: lonPrimaryContainer,
                secondary: lsecondary,
                onSecondary: lonSecondary,
                secondaryContainer: lsecondaryContainer,
                onSecondaryContainer: lonSecondaryContainer,
                tertiary: ltertiary,
                onTertiary: lonTertiary,
                tertiaryContainer: ltertiaryContainer,
                onTertiaryContainer: lonTertiaryContainer,
                error: lerror,
                onError: lonError,
                background: lbackground,
                onBackground: lonBackground,
                surface: lsurface,
                onSurface: lonSurface,
                surfaceTint: lsurfaceTint,
                surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
                blendLevel: 7,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 10,
                  blendOnColors: false,
                  useTextTheme: true,
                  useM2StyleDividerInM3: true,
                  alignedDropdown: true,
                  useInputDecoratorThemeInDialogs: true,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                swapLegacyOnMaterial3: true,
              ).copyWith(
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      backgroundColor: lbackgroundColor, elevation: 0)),
              darkTheme: FlexThemeData.dark(
                primary: dprimary,
                onPrimary: donPrimary,
                primaryContainer: dprimaryContainer,
                onPrimaryContainer: donPrimaryContainer,
                secondary: dsecondary,
                onSecondary: donSecondary,
                secondaryContainer: dsecondaryContainer,
                onSecondaryContainer: donSecondaryContainer,
                tertiary: dtertiary,
                onTertiary: donTertiary,
                tertiaryContainer: dtertiaryContainer,
                onTertiaryContainer: donTertiaryContainer,
                error: derror,
                onError: donError,
                background: dbackground,
                onBackground: donBackground,
                surface: dsurface,
                onSurface: donSurface,
                surfaceTint: dsurfaceTint,
                useMaterial3: true,
                surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
                blendLevel: 13,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 20,
                  useTextTheme: true,
                  useM2StyleDividerInM3: true,
                  alignedDropdown: true,
                  useInputDecoratorThemeInDialogs: true,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                swapLegacyOnMaterial3: true,
                appBarStyle: FlexAppBarStyle.background,
                appBarOpacity: 0.90,
                fontFamily: GoogleFonts.roboto().fontFamily,
                tabBarStyle: FlexTabBarStyle.forBackground,
              ).copyWith(
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: dscaffoldBackgroundColor,
                  appBarTheme: const AppBarTheme(
                      backgroundColor: dbackgroundColor, elevation: 0)),
              themeMode: ThemeMode.system,
              onGenerateRoute: (settings) => onGenerateRoute(settings),
              /*If Token is not empty, it means we have saved the token and can go to app bottomNav Page.
              Else we go to SignupPage*/
              home: ref.watch(userChangedNotifierProvider).user.token.isNotEmpty
                  ? const ScreenLayoutDimension(
                      webScreen: WebScreen(), mobileScreen: MobileScreen())
                  : const RegisterPage());
        });
  }
}
