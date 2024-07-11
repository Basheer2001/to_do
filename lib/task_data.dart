import 'dart:collection';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:to_do/cash_helper.dart';

import 'Modules/tasks.dart';

 class TaskData extends  ChangeNotifier {

   List<Task> task =[
     Task(name: 'task1'),
     Task(name: 'task2'),
     Task(name: 'task3'),
  ];




  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(task);
}
  void addTask(String data){
    final task1 =  Task(name:data);
    task.add(task1);
    CashHelper.putDataAtEnd(jsonEncode(task));
    notifyListeners();
  }
  int get taskCount{
    return task.length;
  }
  void check(int a){
    task[a].toggleDone();
    CashHelper.putDataAtEnd(jsonEncode(task));

    notifyListeners();

  }
  void delet(int a){
    task.remove(task[a]);
    CashHelper.putDataAtEnd(jsonEncode(task));

    notifyListeners();
  }
  void deletAll(){
    task.clear();
    CashHelper.putDataAtEnd(jsonEncode(task));
    CashHelper.putDeletBool();
    notifyListeners();
  }
  void resetAll(){
    task.forEach((element) {
      element.isDone?element.toggleDone():element.isDone;
    });
    CashHelper.putDataAtEnd(jsonEncode(task));

    notifyListeners();
  }
  void Edit(int a,String name){
    task[a] = Task(name: name,isDone: task[a].isDone);
    CashHelper.putDataAtEnd(jsonEncode(task));
    notifyListeners();
  }

  void start()async{
    task = await CashHelper.startCash(task);
    notifyListeners();
  }
 }