import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_final_project/providers/task_provider.dart';
import 'package:todo_final_project/ui/models/task.dart';
import 'package:todo_final_project/ui/views/edit_task/edit_task_view.dart';
import '../../../dialog_utils.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),

      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(18)
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
                onPressed: (buildContext){
                  deleteTask();
                },
              borderRadius: BorderRadius.circular(12),
              label: 'Delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,

            )
          ],
        ),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, EditTaskView.routeName,arguments: widget.task);
          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18)
            ),

            padding: const EdgeInsets.all(12),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  height: 80,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),

                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 280,
                      child: Text(widget.task.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 280,
                      child: Text(widget.task.description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 7),
                  height: 50,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Image(image: AssetImage("assets/images/check.png"),

                  )
                ),
              ],
            ),


          ),
        ),
      ),
    );
  }

  void deleteTask(){
    DialogUtils.showMessage(context, "Are you sure you want to delete this task",
      negActionName: "Yes",
      negAction: ()async{
      await widget.task.delete();
      DialogUtils.showToast(context, 'Task deleted successfully');
      Provider.of<TaskProvider>(context,listen: false).fetchAllNotes();
      },
      posActionName: "Cancel",
    );
  }

}
