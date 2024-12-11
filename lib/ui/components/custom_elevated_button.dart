import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String name;
  final bool isLoading ;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(kPrimarySwatch),
        padding:const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
        shape:  WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
        )
    ),
      onPressed: (){
        onPressed();
      },
      child: isLoading==true? const CircularProgressIndicator(color: Colors.blue,):
      Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium?.
        copyWith(
        fontWeight:FontWeight.bold,
        color: Colors.white
        ),
      )
    );
  }
}
