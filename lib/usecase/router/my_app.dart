import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../l10n/app_localizations.dart';
import '../../core/constants/fonts.dart';
import '../../core/constants/sizes.dart';
import '../landing/presentation/cubits/hover_cubit.dart';
import 'main_wrapper_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HoverCubit()),
        ],
        child: MaterialApp(
            title: 'Carlo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: Sizes.largeTitleFont,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xAC000000),
                  height: 1.8,
                ),
                bodyMedium: TextStyle(
                  fontSize: Sizes.mainFont,
                  // fontWeight: FontWeight.bold,
                  color: const Color(0xAC000000),
                ),
                displayMedium: TextStyle(
                  fontSize: Sizes.mainFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                headlineMedium: TextStyle(
                    fontSize: Sizes.mainFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: Fonts.din,
            ),
            home: const MainWrapperPage()));
  }
}
