import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/home/home.dart';
import 'package:news/theme/mytheme.dart';
import 'package:provider/provider.dart';
import 'Provider/localprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc_observer_test.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
      },
      theme: MyTheme.lightTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

    );
  }
}
