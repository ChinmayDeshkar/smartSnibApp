import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'all_activities.dart';

class ActivitiesLoader extends StatefulWidget {
  String app_id;
  ActivitiesLoader(this.app_id);

  @override
  _ActivitiesLoaderState createState() => _ActivitiesLoaderState(app_id);
}

class _ActivitiesLoaderState extends State<ActivitiesLoader> {
  String app_id;
  _ActivitiesLoaderState(this.app_id);

  void getAccessDetails() async{
    // SERVER LOGIN API URL
      var url = Uri.parse('https://smart-snib2.000webhostapp.com/run_query.php');
      
      var query = "SELECT * FROM `logs` INNER JOIN `lock_info` WHERE `logs`.`Lock_ID` = `lock_info`.`Lock_ID` AND access_id = '"+app_id+"' ORDER BY `logs`.`TimeStamp` DESC";
      print(query);
      // Starting Web API Call.
      var response = await http.post(url, body: json.encode({"query" : query}));
      
      // Getting Server response into variable.
      var lockInfoRecieved = jsonDecode(response.body);
      int i = 0;
          Map<String, Map> superMap = new Map();
      print(lockInfoRecieved[0]['accessby']);
      for (var item in lockInfoRecieved) {
          superMap[i.toString()] = new Map();
          superMap[i.toString()].addAll(item);
          i++;

      }     
     Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => AllActivities(app_id, superMap),
    ));
  }

      void initState() {
      super.initState();
      getAccessDetails();
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