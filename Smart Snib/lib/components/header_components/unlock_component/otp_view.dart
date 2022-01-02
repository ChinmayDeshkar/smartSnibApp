import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';
import 'lock_dashboard.dart';
import 'loader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_otp/flutter_otp.dart';

class OtpView extends StatelessWidget {
  bool _valid = true;
  String lock_id, app_id, mobno;
  // This widget is the root of your application.
  var otp_recived;
  OtpView(this.otp_recived, this.lock_id, this.app_id, this.mobno);

  Future updateStatus() async{
    print("-------- Update Status -----------------------------");
 
  // SERVER LOGIN API URL
  var url = Uri.parse('https://smart-snib2.000webhostapp.com/Updatestatus.php?lock=3');
 
  // Store all data with Param Name.
  var data = {"status" : 1};

  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));
  print(url);
  print(response.body);
  
}



  Future<String> validateOtp(String otp) async {
    print("-------------  $otp_recived  ------------------");
    // await Future.delayed(Duration(milliseconds: 2000));
    await resultChecker(otp);
    if (_valid) {
      updateStatus();
      return null;
    } else {
      return "In-Valid OTP!";
    }
  }
  
  Future resultChecker(String enteredOtp) {
    //To validate OTP
    // return enteredOtp == otp['otp'];
    if (enteredOtp.toString() == otp_recived.toString()) {
      _valid = true;
    } else {
      _valid = false;
    }
    return null;
  }

  void moveToNextScreen(context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SuccessfulOtpScreen(lock_id,app_id)));
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpScreen.withGradientBackground(
          topColor: Colors.blue,
          bottomColor: Colors.blue[700],
          otpLength: 6,
          validateOtp: validateOtp,
          routeCallback: moveToNextScreen,
          themeColor: Colors.white,
          titleColor: Colors.white,
          title: "OTP Verification",
          subTitle: "Enter the code sent to \n +91"+mobno,
          icon: Image.asset(
            'assets/SmartSnib.png',
            fit: BoxFit.contain,
          ),
      ),
    );
  }
}

class SuccessfulOtpScreen extends StatelessWidget {
  String lock_id, app_id;
  SuccessfulOtpScreen(this.lock_id, this.app_id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
              SizedBox(height: 150),
              Center(
              child: Image.asset("assets/verified.gif"),
            ),
            
          Text("Otp verification successful",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),

          SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 10),
              onPressed: () {
                print("--------------------------Change page------------------------");
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
                (BuildContext context){return LoaderScreen(lock_id,app_id);}));

               },
              child: Text('Proceed'),
            )

          ],),
        ),
      ),
    )
    );
  }
}