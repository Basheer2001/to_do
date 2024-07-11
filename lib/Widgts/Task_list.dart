import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_data.dart';

import '../Modules/tasks.dart';
import '../Screens/edit_task_screen.dart';
import 'Task_tile.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ( context, taskData,  child) {
        return ListView.builder(itemBuilder: (context,Index){
          return  TaskTile(
            taskTitle:taskData.tasks[Index].name,
            isChecked:taskData.tasks[Index].isDone,
            checkBoxCallback: ( x ) {
              taskData.check(Index); },
            onLongPress: () {
              taskData.delet(Index);
            },
            editCallback: () {
              showModalBottomSheet(context: context,
                  builder: (context) {
                    return EditTaskScreen(index: Index,);
                  }
              );
            },



          );

        },
          itemCount: taskData.taskCount,






        );
      },

    );
  }
}