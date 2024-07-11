import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/cash_helper.dart';
import '../Modules/tasks.dart';
import '../Widgts/Task_list.dart';
import '../task_data.dart';
import 'add_task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState()  {
    super.initState();
    Provider.of<TaskData>(context, listen: false).start();
    CashHelper.isDark = CashHelper.pref.getBool('darkMode')??CashHelper.isDark;

  }
 // @override
 //  void deactivate()async {
 //    super.deactivate();
 //    print('lkjhgfghjkl;lkjhygtfdcvbnm,mnbvcx');
 //   await CashHelper.putDataAtEnd(jsonEncode(Provider.of<TaskData>(context, listen: false).task));
 //   CashHelper.pref.reload();
 //  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        //color: Colors.amberAccent,
        color: CashHelper.isDark?Color(0xFF2B2B2B):Colors.amberAccent,
        child: Stack(

             children:[

            Column (
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Container(
                //color: Colors.amberAccent,
                //color: Colors.black54,
                width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                 top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius :30,
                        child: Icon(
                          Icons.list,
                         // color: Colors.amberAccent,

                          color: CashHelper.isDark?Color(0xFF2B2B2B):Colors.amberAccent,
                          size: 30,
                        ),
                      backgroundColor:Colors.white,
                    ),
                    Text(
                      'Todo',
                      style: TextStyle(
                        color: Colors.white,
                          fontWeight:FontWeight.w700 ,
                        fontSize: 50
                      ),
                    ),
                    Text(

                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: TextStyle(
                          color: Colors.white,
                      fontSize: 18),
                    ),

                  ],
                ),
              ),
                ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                    ) ,
                    //color: Colors.white,
                    color: CashHelper.isDark?Color(0xFF3C3F41):Colors.white,

                  ),
                  child: TaskList(),
                ),
              ),
            ],
          ),
               Positioned(
                 top: 60,
                 right: 20,
                 child: PopupMenuButton(
                     child: Icon(Icons.more_vert,color: Colors.white,size: 30,),

                     itemBuilder:
                         (context) {
                       return [
                         PopupMenuItem<int>(value: 0, child: Text('delet all')),
                         PopupMenuItem<int>(value: 1, child: Text('reset all')),
                         PopupMenuItem<int>(value: 2, child: Center(child: Icon(CashHelper.isDark?Icons.light_mode:Icons.dark_mode))),


                       ];
                     },
                     onSelected: (value) {
                       if (value == 0) {
                         Provider.of<TaskData>(context,listen: false).deletAll();

                       }
                       if (value == 1) {
                         Provider.of<TaskData>(context,listen: false).resetAll();

                       }
                       if (value == 2) {
                         setState(() {
                           CashHelper.isDark = !CashHelper.isDark;
                         });
                         CashHelper.pref.setBool('darkMode', CashHelper.isDark);

                       }


                     }

                 ),),
             ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
      //backgroundColor: Colors.amberAccent,
       backgroundColor:CashHelper.isDark?Color(0xFF2B2B2B):Colors.amberAccent,

      onPressed: () {

            showModalBottomSheet(
                context: context,
              builder: (context) {
                return AddTaskScreen();
          }
          );
        },
        child: Icon(Icons.add),

      ),
    );
  }
}



//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Modules/tasks.dart';
// import '../Widgts/Task_list.dart';
// import '../task_data.dart';
// import 'add_task_screen.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.lightBlueAccent,
//           child: Icon(Icons.add),
//           onPressed: () {
//             showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 builder: (context) => SingleChildScrollView(
//                     child:Container(
//                       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//                       child: AddTaskScreen(),
//                     )
//                 )
//             );
//           }
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(
//                 top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 CircleAvatar(
//                   child: Icon(
//                     Icons.list,
//                     size: 30.0,
//                     color: Colors.lightBlueAccent,
//                   ),
//                   backgroundColor: Colors.white,
//                   radius: 30.0,
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   'Todo',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 50.0,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Text(
//                   '${Provider.of<TaskData>(context).taskCount} Tasks',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: TaskList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
