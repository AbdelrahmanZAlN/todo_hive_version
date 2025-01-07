import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_final_project/providers/task_provider.dart';
import 'package:todo_final_project/services/local/cache_helper.dart';
import 'package:todo_final_project/ui/constants.dart';
import 'package:todo_final_project/ui/my_theme_data.dart';
import 'package:todo_final_project/ui/views/edit_task/edit_task_view.dart';
import 'package:todo_final_project/ui/views/home/home_view.dart';
import 'package:todo_final_project/ui/views/splash/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'providers/settings_provider.dart';
import 'ui/models/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(kTasksBox);
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark'); // Default handled here
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()..changeAppMode(fromShared: isDark)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: "Todo",
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        EditTaskView.routeName: (_) => const EditTaskView(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.languageCode),
    );
  }
}
