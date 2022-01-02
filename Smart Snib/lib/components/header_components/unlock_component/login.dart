import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'otp_view.dart';
import '../../google_pay_home.dart';
import 'dart:convert';
import 'dart:math';
import 'package:sms/sms.dart';

class LoginView extends StatelessWidget {
  String lock_id, app_id;
  LoginView(this.lock_id, this.app_id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(lock_id, app_id),
    );
  }
}

class Login extends StatefulWidget {
  String lock_id, app_id;
  Login(this.lock_id, this.app_id);
  @override
  _LoginState createState() => _LoginState(lock_id, app_id);
}

class _LoginState extends State<Login>{
  String lock_id, app_id;
  _LoginState(this.lock_id, this.app_id);
  
  final user=new TextEditingController();
	final pass=new TextEditingController();

  Future userLogin() async{

  String usr = user.text;
  String pwd = pass.text;
  print("----------- user: " + usr + "pwd : " + pwd + " -------------------");
 
  // SERVER LOGIN API URL
  var url = Uri.parse('https://smart-snib2.000webhostapp.com/mysql.php');
 
  // Store all data with Param Name.
  var data = {'user': usr, 'password' : pwd};
 
  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));
 
  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  // If the Response Message is Matched.
  if(message == 1)
  {
   Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OtpView(_otp, lock_id, app_id, mobno.toString())));
  }else{
    
    Widget alert = AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              title: const Text('Invalid Credentials'),
              actions: <Widget>[
                
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => GooglePayHome(app_id)));
                    },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
 }
}

int _otp, _minOtpValue, _maxOtpValue;
String mobno;

  void getContactNumber() async{

    String usr = user.text;
    String pwd = pass.text;
      // SERVER LOGIN API URL
      var url = Uri.parse('https://smart-snib2.000webhostapp.com/getContacts.php');
    
      // Store all data with Param Name.
      var data = {'user': usr, 'password' : pwd};

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));
      
      // Getting Server response into variable.
      var message = await jsonDecode(response.body.toString());

      print("---------------------------------------------------------------");
      mobno = message.toString();

      print(mobno);
  }

  void generateOtp([int min = 100000, int max = 999999]) {
    //Generates four digit OTP by default
    _minOtpValue = min;
    _maxOtpValue = max;
    _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
  }

  Future<dynamic> sendOtp(String phoneNumber,
      [String messageText,
      int min = 100000,
      int max = 999999,
      String countryCode = '+1']) {
    //function parameter 'message' is optional.
    generateOtp(min, max);
    print(_otp);
    SmsSender sender = new SmsSender();
    String address = (countryCode ?? '+1') +
        phoneNumber; // +1 for USA. Change it according to use.

    sender.sendSms(new SmsMessage(
        address, (messageText ?? 'Your OTP is : ') + _otp.toString()));
        return null;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child:Column(
           children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 250,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/SmartSnib.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Identification Number',
                    hintText: ''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: ''),
              ),
            ),
            
            SizedBox(height: 30),
            Container(
              height: 40,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async{
                  await getContactNumber();
                  await sendOtp(mobno,"", 100000, 999999, '+91');
                  await userLogin();
                },
                child: Text(
                  'Generate OTP',    
                  style: TextStyle(fontFamily: 'mono',color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            
          ],
        ),
      ),
    );
  }
}