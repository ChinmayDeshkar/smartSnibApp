import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart' ;


class Scanner extends StatefulWidget {
  String app_id;
  Scanner(this.app_id);
  @override
  _ScannerState createState() => _ScannerState(app_id);
}
 
class _ScannerState extends State<Scanner> {

  String app_id;
  _ScannerState(this.app_id);

  List<String> lock_ids =[];
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
 

  Future<List<String>> getLockid() async{
    // lock_ids =[];
    // SERVER LOGIN API URL
    var url = Uri.parse('https://smart-snib2.000webhostapp.com/get_lock_id.php');

    // Starting Web API Call.
    var response = await http.post(url);
    var jsonString = response.body.toString();
    // Getting Server response into variable.
    List temp = jsonDecode(jsonString);

    for (var i = 0; i < temp.length; i++) {
      lock_ids.add(temp[i]);
    }
    // for (var i = 0; i < lock_ids.length; i++) {
    //   print(lock_ids[i]);
    // }
    return lock_ids;
  }
  
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
   Widget build(BuildContext context) {

      void _onQRViewCreated(QRViewController controller) async{
        Future<List<String>> temp = getLockid();
        List lockData = await temp;
        
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) async {
      
      int flag = 0;
      controller.pauseCamera();
      if (await scanData.code != Null) {
        for (var item in lockData) {
          if(scanData.code==item){
            flag = 1;
            await  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (BuildContext context){return LoginView(item,app_id);}));
            
          }
         
        }
          
        if(flag == 0)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid qr code'),
              content: Text(scanData.code),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());

        controller.resumeCamera();
      
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('invalid qr code'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Response Type: ${describeEnum(scanData.format)}'),
                    Text('Data: ${scanData.code}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
    });
  }
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }  
}