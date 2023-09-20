import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/my_theme.dart';
import 'package:todoapp/task_list/task_widget.dart';

import '../providers/app_config_providers.dart';

class taskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(children: [
      CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor:
            provider.isDarkMode() ? myTheme.grayColor : myTheme.blackColor,
        dayColor:
            provider.isDarkMode() ? myTheme.grayColor : myTheme.blackColor,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: myTheme.primaryLight,
        dotsColor: Colors.white,
        selectableDayPredicate: (date) => true,
        locale: 'en_ISO',
      ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return taskWidget();
          },
          itemCount: 30,
        ),
      )
    ]);
  }
}
