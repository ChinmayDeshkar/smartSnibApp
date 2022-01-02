import 'package:flutter/material.dart';

class AllActivities extends StatelessWidget {
  String app_id;
  Map<String, Map> allData = new Map();
  AllActivities(this.app_id, this.allData);
  
  void debug(){
    print(allData);
  }

  @override
  Widget build(BuildContext context) {
    // print(allData);
    debug();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Recent Activites",
          style: TextStyle(
            color: Colors.black
          ),
          ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: allData.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                  size: 40,
                  ),
                title: Text(
                  allData['$index']['o_fname'].toString() + " "+ allData['$index']['o_lname'].toString(),
                  // "ABC",
                  style: TextStyle(
                    fontSize: 22
                  ),
                  ),
                subtitle: Text(allData['$index']['Date'].toString() +" | "+allData['$index']['Time'].toString().substring(0,5)),
                trailing: Icon(
                  Icons.verified_rounded,
                  color: Colors.green,
                  ),
              ),
            );
                
          },
      ),
    )
    );
  }
}