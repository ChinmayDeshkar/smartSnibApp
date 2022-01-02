import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'lock_dashboard.dart';
import 'package:intl/intl.dart';

class LoaderScreen extends StatefulWidget {
  String lock_id, app_id;
  LoaderScreen(this.lock_id, this.app_id);
  @override
  _LoaderScreenState createState() => _LoaderScreenState(lock_id, app_id);
}

class _LoaderScreenState extends State<LoaderScreen> {
  String lock_id, app_id;
  _LoaderScreenState(this.lock_id, this.app_id);

  void getSensorValues() async{
    // SERVER LOGIN API URL
      var url = Uri.parse('https://smart-snib2.000webhostapp.com/get_temp_hum.php');
      var url2 = Uri.parse('https://smart-snib2.000webhostapp.com/run_query.php');
      
      var query = "SELECT area, o_fname, o_lname FROM `lock_info` WHERE Lock_ID = '"+lock_id.toLowerCase()+"'";
      
      // Starting Web API Call.
      print("====================== " + lock_id + "===================");
      var response = await http.post(url, body: json.encode({"lock_id" : lock_id.toLowerCase()}));
      var response2 = await http.post(url2, body: json.encode({"query" : query}));
      
      // Getting Server response into variable.
      var message = jsonDecode(response.body);
      var lockInfoRecieved = jsonDecode(response2.body);
      print(lockInfoRecieved[0]['area']);
      Map lockInfo = {"area": lockInfoRecieved[0]['area'], "Owner" : lockInfoRecieved[0]['o_fname'] + " " + lockInfoRecieved[0]['o_lname']};
      // Map lockInfo ={};
      
      var temp = message[0];
      var humidity = message[1];
      Map data = {"tempreture" : temp, "Humidity" : humidity, };
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) => Lock_Dashboard(data)));
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => Lock_Dashboard(data, lock_id,lockInfo, app_id),
    ));
  }

    void initState() {
      super.initState();
      getSensorValues();
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