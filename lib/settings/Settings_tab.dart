import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/my_theme.dart';

import '../providers/app_config_providers.dart';

class settingTab extends StatefulWidget {
  @override
  State<settingTab> createState() => _settingTabState();
}

class _settingTabState extends State<settingTab> {
  String? selectedOption;
  String? selectedoption;

  List<String> _dropdownItems = [
    'Light',
    'Dark',
  ];
  List<String> LocaleItem = [
    'Arabic',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            padding: EdgeInsets.all(20),
            decoration: InputDecoration(
                label: Text(
              AppLocalizations.of(context)!.theme,
              style: TextStyle(
                  color: provider.isDarkMode()
                      ? myTheme.grayColor
                      : myTheme.blackColor),
            )),
            value: selectedOption,
            items: [
              DropdownMenuItem(
                value: 'Light',
                child: Text(
                  AppLocalizations.of(context)!.light,
                  // style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              DropdownMenuItem(
                value: 'Dark',
                child: Text(
                  AppLocalizations.of(context)!.dark,
                  // style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
              if (value == 'Light') {
                return provider.ChangeTheme(ThemeMode.light);
              } else if (value == 'Dark') {
                return provider.ChangeTheme(ThemeMode.dark);
              }
            },
          ),
          DropdownButtonFormField<String>(
            padding: EdgeInsets.all(20),
            decoration: InputDecoration(
                label: Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                  color: provider.isDarkMode()
                      ? myTheme.grayColor
                      : myTheme.blackColor),
            )),
            value: selectedoption,
            items: [
              DropdownMenuItem(
                value: 'Arabic',
                child: Text(
                  AppLocalizations.of(context)!.arabic,
                  // style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              DropdownMenuItem(
                value: 'English',
                child: Text(
                  AppLocalizations.of(context)!.english,
                  // style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedoption = value;
              });
              if (value == 'Arabic') {
                return provider.ChandeLanguage('ar');
              } else if (value == 'English') {
                return provider.ChandeLanguage('en');
              }
            },
          ),
        ],
      ),
    );
  }
}
