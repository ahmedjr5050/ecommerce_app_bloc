import 'package:app2/features/auth/signin/manage/cubit/signin_cubit.dart';
import 'package:app2/features/auth/signup/manage/cubit/signup_cubit.dart';
import 'package:app2/features/search/manage/cubit/cubit/search_cubit.dart';
import 'package:app2/features/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:app2/core/theme.dart';
import 'package:app2/features/home/manage/cubit/featurebanner/home_cubit.dart';
import 'package:app2/features/home/manage/cubit/featurehombar/parapp_cubit.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ParappCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => SigninCubit()),
        BlocProvider(create: (context) => SignupCubit()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
