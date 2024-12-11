import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_final_project/providers/task_provider.dart';
import 'package:todo_final_project/ui/dialog_utils.dart';
import 'package:todo_final_project/ui/models/task.dart';

import '../../../date_utils.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../constants.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode= AutovalidateMode.disabled;
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .125),
            child: Text('Add A New Task',
                style: Theme.of(context).textTheme.headlineMedium
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          // CustomTextFormField(
          //   label: "enter your task title",
          //   validator: (text){
          //     if(text?.trim().isEmpty ?? true) {
          //       return 'please enter your task title';
          //     }
          //     return null;
          //   },),
          // // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          // CustomTextFormField(
          //   label: "task description",
          //   validator: (text){
          //     if(text?.trim().isEmpty ?? true) {
          //       return 'please enter your task description';
          //     }
          //     return null;
          // },
          //   lines: 5,
          // ),
          CustomTextFormField(
            label: "Enter your task title",
            validator: (text) {
              if (text?.trim().isEmpty ?? true) {
                return 'Please enter your task title';
              }
              return null;
            },
            onSaved: (text) => title = text, // Update title
          ),
          CustomTextFormField(
            label: "Task description",
            validator: (text) {
              if (text?.trim().isEmpty ?? true) {
                return 'Please enter your task description';
              }
              return null;
            },
            lines: 5,
            onSaved: (text) => description = text, // Update description
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          const Text('Select Time',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          InkWell(

            onTap: (){
              showTaskDatePicker();
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(
                      color: Colors.black26
                  ))
              ),
              child: Text("${MyDateUtils.formateTaskDate(selectedDate)}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          CustomElevatedButton(
            // isLoading: state is AddNoteLoadingState? true : false,
            onPressed: (){
              addTask();
            },
            name: 'Add',),

          // ElevatedButton(
          //   onPressed: (){
          //   addTask();
          // },
          //   style: ButtonStyle(
          //     foregroundColor: const WidgetStatePropertyAll(Colors.white),
          //     backgroundColor: const WidgetStatePropertyAll(kPrimarySwatch),
          //     shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         )
          //     ),
          //     padding: const WidgetStatePropertyAll(EdgeInsets.all(13))
          //   ),
          //   child: const Text('Add Task',
          //     style: TextStyle(fontSize: 18 ),
          //   ),
          // ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        ],
      ),
    );

  }
  // void addTask ()async{
  //   TaskProvider taskProvider=Provider.of<TaskProvider>(context, listen: false);
  //   if(formKey.currentState!.validate()==true){
  //     formKey.currentState!.save();
  //
  //     var taskModel= Task(
  //       title: title!,
  //       description: description!,
  //       date: DateFormat('yyyy MMM dd').format(DateTime.now()),
  //     );
  //     DialogUtils.showToast(context, 'loading');
  //
  //     try {
  //       taskProvider.addTask(taskModel);
  //       taskProvider.fetchAllNotes();
  //       DialogUtils.showToast(context, 'Added successfully');
  //       debugPrint(taskModel.title);
  //
  //     } catch(e){
  //       debugPrint('$e');
  //       DialogUtils.showToast(context, 'something went wrong');
  //     }
  //   }
  //   else {
  //     autoValidateMode=AutovalidateMode.always;
  //     setState(() {
  //
  //     });
  //   }
  // }

  void addTask() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      final taskModel = Task(
        title: title!,
        description: description!,
        date: DateFormat('yyyy-MM-dd').format(selectedDate), // Consistent format
      );

      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      try {
        await taskProvider.addTask(taskModel);
        DialogUtils.showToast(context, 'Task added successfully');
        Navigator.pop(context); // Close bottom sheet
      } catch (e) {
        DialogUtils.showToast(context, 'Something went wrong');
        debugPrint('$e');
      }
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  var selectedDate= DateTime.now();

  void showTaskDatePicker()async{
    var date= await showDatePicker(context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if(date == null) return;

    selectedDate = date;
    setState(() {

    });
  }

}
