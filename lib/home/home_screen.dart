import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/my_theme.dart';
import 'package:todoapp/task_list/taslListTab.dart';

import '../providers/app_config_providers.dart';
import '../settings/Settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: provider.isDarkMode() ? myTheme.blackDark : myTheme.whiteColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.task_list,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowBottomSheetaddTask();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Tabs[selectedIndex],
    );
  }

  List<Widget> Tabs = [taskList(), settingTab()];

  void ShowBottomSheetaddTask() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: ((context) => AddTaskBottomsheet()));
  }
}

class AddTaskBottomsheet extends StatefulWidget {
  @override
  State<AddTaskBottomsheet> createState() => _AddTaskBottomsheetState();
}

class _AddTaskBottomsheetState extends State<AddTaskBottomsheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          color:
              provider.isDarkMode() ? myTheme.blackDark : myTheme.whiteColor),
      padding: EdgeInsets.all(14),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.new_task,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: myTheme.grayColor)
                : Theme.of(context).textTheme.titleMedium,
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_task_title;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        label: Text(
                          AppLocalizations.of(context)!.task_name,
                          style: provider.isDarkMode()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: myTheme.grayColor)
                              : Theme.of(context).textTheme.titleMedium,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_task_description;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        label: Text(
                          AppLocalizations.of(context)!.task_des,
                          style: provider.isDarkMode()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: myTheme.grayColor)
                              : Theme.of(context).textTheme.titleMedium,
                        )),
                    maxLines: 4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    AppLocalizations.of(context)!.select_date,
                    style: provider.isDarkMode()
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: myTheme.grayColor)
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                InkWell(
                    onTap: () {
                      showCalender();
                    },
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      textAlign: TextAlign.center,
                      style: provider.isDarkMode()
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: myTheme.grayColor)
                          : Theme.of(context).textTheme.titleSmall,
                    )),
                ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.add,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {}
  }
}
