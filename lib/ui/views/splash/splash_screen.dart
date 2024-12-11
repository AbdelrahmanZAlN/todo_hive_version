import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/views/home/home_view.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName ='splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    },
    );
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),


    );

  }
}
