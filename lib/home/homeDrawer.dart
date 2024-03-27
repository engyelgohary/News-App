// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news/theme/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeDrawer extends StatelessWidget {
  Function Selected;
  static int categories = 1;
  static int settings = 2;
  HomeDrawer({required this.Selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * .08),
          color: MyTheme.primaryColor,
          child: Text(
            AppLocalizations.of(context)!.news,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Selected(categories);
            },
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Selected(settings);
            },
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
