import 'package:flutter/material.dart';
import '../../google_pay_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lock_Dashboard extends StatefulWidget {
  // Getting Argument data in Map Form
  Map data, lockInfo;
  String lock_id, app_id;
  Lock_Dashboard(this.data, this.lock_id, this.lockInfo, this.app_id);

  @override
  _Lock_DashboardState createState() => _Lock_DashboardState(data, lock_id, lockInfo,app_id);
}

class _Lock_DashboardState extends State<Lock_Dashboard> {

  // Getting Argument data in Map Form 
  Map data, lockInfo;String lock_id, app_id;
  _Lock_DashboardState(this.data, this.lock_id, this.lockInfo, this.app_id);
  
  bool _lock1Pressed = false;
  bool _lock2Pressed = false;

  @override
  Widget build(BuildContext context) {
    
    // Function to Update Lock Status on Database
    Future updateStatus(int lock) async{
        print(" ----------------------------- Update Status -----------------------------");
    
      // SERVER LOGIN API URL
      var url = Uri.parse('https://smart-snib2.000webhostapp.com/Updatestatus.php?lock='+lock.toString());
    print(url);
      // Store all data with Param Name.
      var data = {"status" : 0};
    
      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));
      print(response.body);
    
    }
    
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dashboard"),
      ),
      body:Column(
        children: <Widget>[
          Card(
            elevation : 3,
              child: Padding( 
                padding : EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        Text(
                          "  Id : $lock_id",
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ]
                    ),
                    
                    SizedBox(height: 7),

                    Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      
                      Text(
                        "  Area: "+lockInfo['area'],
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ]
                    ),

                    SizedBox(height: 7),
                    
                    Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                      ),
                      
                      Text(
                        "  Owner: "+lockInfo['Owner'],
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ]
                    ),
                  ],
                )
              )
            ),

          SizedBox(height: 5,),
          
          Card(
            elevation : 3,
            child: ListTile(
              leading: Icon(
                  Icons.thermostat,
                  color: Colors.blue,
                  size: 36.0,
                ),
              title: Text(
                'Tempreture',
                style: TextStyle(
                  fontSize: 23,
                ),
                ),
              subtitle: Text(
                data["tempreture"] + " °C",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
            ),
          ),
          Card(
            elevation : 3,
            child: ListTile(
              leading: Icon(
                  Icons.cloud,
                  color: Colors.blue,
                  size: 36.0,
                ),
              title: Text(
                'Humidity',
                style: TextStyle(
                  fontSize: 23,
                ),
                
                ),
              subtitle: Text(
                data["Humidity"] + " %",
                  style: TextStyle(
                    fontSize: 18,
                  ),          
              ),
            ),
          ),
          
          SizedBox(height: 10),

          Container(
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: _lock1Pressed ? Colors.green : Colors.blue
                ),
              onPressed: () async{
                await updateStatus(1);
                setState(() {
                  _lock1Pressed = true;
                });

                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => GooglePayHome(app_id)));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(2, 7, 5, 7),
                child: Text(
                  "Lock1: Lock Again",
                  style: TextStyle(
                    fontSize: 23
                  ),
                  ),
              ),
            ),
          ),

          SizedBox(height: 10),

          Container(
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: _lock2Pressed ? Colors.green : Colors.blue
                ),
                
              onPressed: () async{
                if(_lock1Pressed){
                  await updateStatus(2);
                  setState(() {
                    _lock2Pressed = true;
                  });
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => GooglePayHome(app_id)));
                }
                else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        title: const Text('Warning!!'),
                        content: new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Lock 1 should be locked first"),
                          ],
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            textColor: Theme.of(context).primaryColor,
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(2, 7, 5, 7),
                child: Text(
                  "Lock2: Lock Again",
                  style: TextStyle(
                    fontSize: 23
                  ),
                  ),
              ),
            ),
          )
        ],
      )

      );
  }
}


