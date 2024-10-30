import 'package:duolingo/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/routes.dart';
import '../../l10n/app_localizations.dart';
import '../landing/presentation/cubits/hover_cubit.dart';
import '../responsive/presentation/cubits/screen_size_cubit.dart';
import 'main_wrapper_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HoverCubit()),
          BlocProvider(create: (context) => ScreenSizeCubit()),
        ],
        child: MaterialApp(
            initialRoute: "/",
            title: 'Carlo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routes: Routes.routes,
            theme: Themes.themeData,
            home: const MainWrapperPage()));
  }
}
