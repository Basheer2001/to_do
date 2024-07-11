import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modules/tasks.dart';
import '../task_data.dart';
class EditTaskScreen extends StatefulWidget {
  final int index;
  const EditTaskScreen({super.key, required this.index});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreen();
}

class _EditTaskScreen extends State<EditTaskScreen> {
   String? newtitle;
   String? temp;
  TextEditingController textedit = TextEditingController() ;
 @override
  void dispose() {
    super.dispose();
        textedit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textedit.text = temp?? Provider.of<TaskData>(context, listen: false).task[widget.index].name;
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

              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent
              ),
            ),
            TextField(
              controller: textedit,
              minLines: 1,
              maxLines: 10,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newvalue) {
                temp = newvalue;
                textedit.text = newvalue;
                this.newtitle = newvalue;
              },

            ),
            ElevatedButton(
              onPressed: () {
                print(textedit.text);
                Provider.of<TaskData>(context, listen: false).Edit(widget.index, newtitle!);
                Navigator.pop(context);
              },
              child: Text('Save'),
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

