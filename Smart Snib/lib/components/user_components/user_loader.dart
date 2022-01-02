import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'lock_log.dart';

class LoaderScreen extends StatefulWidget {
  String id;
  LoaderScreen(this.id);


  @override
  _LoaderScreenState createState() => _LoaderScreenState(id);
}

class _LoaderScreenState extends State<LoaderScreen> {
  String id;
  _LoaderScreenState(this.id);

List<String> time, date, openby;

  Future getLogs() async{
      time = [];
      date = [];
      openby = [];
      // await print(id);
    // SERVER LOGIN API URL
    var url = Uri.parse('https://smart-snib2.000webhostapp.com/get_logs.php');
 
    // Store all data with Param Name.
    var data = {'id':id};
  
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var jsonString = response.body.toString();
    // Getting Server response into variable.
    var logsData = jsonDecode(jsonString);
    // for (var item in logsData) {

    // }
    for (var i = 0; i < logsData.length; i++) {
      time.add(logsData[i]['Time']);
      date.add(logsData[i]['Date']);
      openby.add(logsData[i]['accessby']);
    }
    Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => Lock_Log(time,date,openby,id)));
    }
  @override
  void initState() {
    
    super.initState();
    getLogs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body:SpinKitWave(
        color: Colors.white,
        size: 50.0,
      ),

    );
  }
}