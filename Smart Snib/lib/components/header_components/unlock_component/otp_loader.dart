import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'lock_dashboard.dart';
class OTPLoader extends StatefulWidget {

  String lock_id, app_id;
  var otp_recived;
  OTPLoader(this.otp_recived, this.lock_id, this.app_id);


  @override
  _OTPLoaderState createState() => _OTPLoaderState(otp_recived, lock_id, app_id);
}

class _OTPLoaderState extends State<OTPLoader> {
  
  String lock_id, app_id;
  // This widget is the root of your application.
  var otp_recived;
  _OTPLoaderState(this.otp_recived, this.lock_id, this.app_id);
void getSensorValues() async{
    // SERVER LOGIN API URL
      var url = Uri.parse('https://smart-snib2.000webhostapp.com/get_temp_hum.php');
      var url2 = Uri.parse('https://smart-snib2.000webhostapp.com/run_query.php');
      
      var query = "SELECT area, owner FROM `lock_details` WHERE lock_id = '"+lock_id+"'";
      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(1));
      var response2 = await http.post(url2, body: json.encode({"query" : query}));
      
      // Getting Server response into variable.
      var message = jsonDecode(response.body);
      var lockInfoRecieved = jsonDecode(response2.body);
      print(lockInfoRecieved[0]['area']);
      Map lockInfo = {"area": lockInfoRecieved[0]['area'], "Owner" : lockInfoRecieved[0]['owner']};
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