import 'dart:convert';

import 'package:flutter/material.dart';
class Task  {
  final String name;
  bool isDone;
  Map toJson() => {
    'name': name,
    'isDone': isDone,
  };

   Task({required this.name, this.isDone = false});
   void toggleDone(){
     isDone=!isDone;
   }
 }