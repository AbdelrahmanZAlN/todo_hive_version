import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/task_provider.dart';
import 'add_task_bottom_sheet.dart';
import 'settings/settings_tab.dart';
import 'todos_list/todos_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
 static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskProvider>(context, listen: false).fetchAllTasks();
    });
  }


  List<Widget> tabs=[
    const TodosListTab(),
    const SettingsTab(),
  ];
 int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title:  Text(AppLocalizations.of(context)!.app_tittle,),
        // titleSpacing: 60,
        toolbarHeight: 60,
        toolbarTextStyle:  const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          wordSpacing: 40,
        ),

      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 9,
        height: 82,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              selectedIndex=index;
              debugPrint('$selectedIndex');
            });
          },
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.items,
              icon: const Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settings,
              icon: const Icon(Icons.settings),
            ),
          ],

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.white,
              width: 4,
            )
        ),
        child: const Icon(Icons.add),

        onPressed: (){
          showAddTaskSheet();

        },
      ),

      body: tabs[selectedIndex],

    );
  }
 void showAddTaskSheet(){
   showModalBottomSheet(
     context: context,
     builder: (BuildContext context) => const AddTaskBottomSheet(),
     isScrollControlled: true,
     shape:const RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
     ),

   );
 }

}