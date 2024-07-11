import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modules/tasks.dart';
import '../task_data.dart';
class AddTaskScreen extends StatefulWidget {

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
   String? title;

  TextEditingController textedit = TextEditingController() ;
   @override
  void dispose() {
     super.dispose();
     textedit.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(

              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent
              ),
            ),
            TextField(
              minLines: 1,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newvalue) {
                this.title = newvalue;
              },


            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(title!);
                Navigator.pop(context);
              },
              child: Text('Add'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((
                      states) => Colors.lightBlueAccent)
              ),
            )
          ],
        ),
      ),
    );
  }
}

