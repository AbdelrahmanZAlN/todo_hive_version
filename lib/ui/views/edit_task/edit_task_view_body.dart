import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/models/task.dart';
import '../../components/custom_text_form_field.dart';

class EditTaskViewBody extends StatefulWidget {
  final Task taskModel;
  final GlobalKey<FormState> formKey;

  const EditTaskViewBody({
    super.key,
    required this.taskModel,
    required this.formKey,
  });

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title, description;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.taskModel.title);
    descriptionController = TextEditingController(text: widget.taskModel.description);

  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: titleController,
              onChange: (text) {
                title = text;
              },
              validator: (text) {
                if (text?.trim().isEmpty ?? true) {
                  return 'Title is required';
                }
                return null;
              },
              onSaved: (text) {
                widget.taskModel.title = text!;
              },
              label: 'Title',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CustomTextFormField(
              controller: descriptionController,
              onChange: (text) {
                description = text;
              },
              validator: (text) {
                if (text?.trim().isEmpty ?? true) {
                  return 'Description is required';
                }
                return null;
              },
              onSaved: (text) {
                widget.taskModel.description = text!;
              },
              label: 'Description',
              lines: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
          ],
        ),
      ),
    );
  }
}
