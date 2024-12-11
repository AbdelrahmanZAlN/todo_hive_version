import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/views/home/add_task_form.dart';


class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 32,
          left: 16,right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: const SingleChildScrollView(child: AddTaskForm()),
    );
  }
}
