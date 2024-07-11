import 'package:flutter/material.dart';

import '../cash_helper.dart';

class TaskTile extends StatelessWidget {



   final String taskTitle;
   final bool isChecked ;
   final void Function (bool?)checkBoxCallback;
   final void Function ()editCallback;
   final void Function ()onLongPress;
  TaskTile({required this.taskTitle, required this.isChecked, required this.checkBoxCallback, required this.onLongPress, required this.editCallback});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      //subtitle: Text('xcvbnm,fghjkluygtfvb nm, lkjhgvb nm, '),
      title: Text(

        taskTitle,
        //overflow: TextOverflow.clip,
        style: TextStyle(

          decoration: isChecked?TextDecoration.lineThrough:null,
          color: CashHelper.isDark?Colors.white:Colors.black,



      ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          ElevatedButton(
            onPressed: editCallback,
            child: Icon(Icons.edit,color: Colors.grey,),
            style: ElevatedButton.styleFrom(
              elevation: 0,
                backgroundColor: Colors.transparent
            ),
          ),
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkBoxCallback,
          ),
        ],
      ),
      onLongPress: this.onLongPress,
    );
  }
}


