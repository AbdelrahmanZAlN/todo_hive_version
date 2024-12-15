import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_final_project/providers/task_provider.dart';
import '../../../../providers/settings_provider.dart';
import 'task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TodosListTab extends StatefulWidget {
  const TodosListTab({super.key});

  @override
  State<TodosListTab> createState() => _TodosListTabState();
}

class _TodosListTabState extends State<TodosListTab> {
  var selectedDate = DateTime.now();
  var focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasksForSelectedDate = taskProvider.tasks.where((task) {
      return isSameDay(DateTime.parse(task.date), selectedDate);
    }).toList();

    return Column(
      children: [
        TableCalendar(
          focusedDay: selectedDate,
          firstDay: DateTime.now().subtract(const Duration(days: 356)),
          lastDay: DateTime.now().add(const Duration(days: 356)),
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          locale: Provider.of<SettingsProvider>(context).languageCode,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
              focusedDate = focusedDay;
            });
          },
        ),
        Expanded(
          child: tasksForSelectedDate.isEmpty ?
          Center(
            child: Text(
              AppLocalizations.of(context)!.no_scheduled_tasks,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ) :
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              final task = tasksForSelectedDate[index];
              return TaskItem(task: task);
            },
            itemCount: tasksForSelectedDate.length,
          ),
        ),
      ],
    );
  }
}
