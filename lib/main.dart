import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/cash_helper.dart';
import 'package:to_do/task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await CashHelper.init();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    //  builder: (context) => TaskData(),
       create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        //theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

}}
