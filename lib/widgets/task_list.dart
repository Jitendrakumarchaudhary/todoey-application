import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskdata, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task=taskdata.tasks[index];
          return TaskTile(
            taskTitle:task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              taskdata.updateTask(task);
            },
            LongPressCallback: (){
              taskdata.deleteTask(task);
            },

          );
        },
        itemCount: taskdata.taskCount,
      ),
    );
  }
}
