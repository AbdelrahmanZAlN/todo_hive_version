import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_final_project/providers/task_provider.dart';
import 'package:todo_final_project/ui/constants.dart';
import 'package:todo_final_project/ui/my_theme_data.dart';
import 'package:todo_final_project/ui/views/edit_task/edit_task_view.dart';
import 'package:todo_final_project/ui/views/home/home_view.dart';
import 'package:todo_final_project/ui/views/splash/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'ui/models/task.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(kTasksBox);

  runApp(ChangeNotifierProvider(
      create: (context)=> TaskProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        EditTaskView.routeName : (_) => const EditTaskView(),
      },
    );
  }
}
