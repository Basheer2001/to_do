import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/task_data.dart';
import 'package:flutter/material.dart';

import 'Modules/tasks.dart';

class CashHelper{
  static late SharedPreferences pref ;
  static  bool isDark = false;
  static Future<void> init ()async{
    pref =  await SharedPreferences.getInstance();
  }

  static Future<void> putDataAtEnd(String s)async {
    await pref.setString('task', s);
  }
  static Future<void> putDeletBool()async {
    await pref.setBool('deletedAll', true);
  }
  static Future<void> putdarkModeBool(bool value)async {
    await pref.setBool('darkMode', value);
  }


  static Future<List<Task>>  startCash(List<Task> list) async {
    List<dynamic> s=[];
    List<Task> l = [];
    bool? b = false;

     try{
       s =  await jsonDecode(pref.getString('task')!);
       b =   pref.getBool('deletedAll');
     }
     catch(e){
       print('the error is $e');
     }

    s.forEach((element) {
      l.add(
          Task(name: element['name'],isDone: element['isDone'])
      );
    });
    if(b==true){
      list = l;
    }
     else{
      list = l.isEmpty?list:l;
    }


    return list;

  }

}