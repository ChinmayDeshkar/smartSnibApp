import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Contacts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    offset: Offset(
                      0,1
                    )
                  ),
                ]
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  ),
                title: Text(
                  "Main Office",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                subtitle: Text(
                  "+91-7066883294",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: () => {
                    launch("tel://7066883294")
                  },
                  child: Icon(
                    Icons.local_phone_rounded,
                    size: 30,
                    ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    offset: Offset(
                      0,1
                    )
                  ),
                ]
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  ),
                title: Text(
                  "Divisional Office",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                subtitle: Text(
                  "+91-8788011514",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: () => {
                    launch("tel://+918788011514")
                  },
                  child: Icon(
                    Icons.local_phone_rounded,
                    size: 30,
                    ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    offset: Offset(
                      0,1
                    )
                  ),
                ]
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  ),
                title: Text(
                  "Sub-Divisional Office",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                subtitle: Text(
                  "+91-8087270041",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: () => {
                    launch("tel://+918087270041")
                  },
                  child: Icon(
                    Icons.local_phone_rounded,
                    size: 30,
                    ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    offset: Offset(
                      0,1
                    )
                  ),
                ]
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  ),
                title: Text(
                  "Regional Office",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                subtitle: Text(
                  "+91-9890569260",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: () => {
                    launch("tel://+919890569260")
                  },
                  child: Icon(
                    Icons.local_phone_rounded,
                    size: 30,
                    ),
                ),
              ),
            ),


          ],
        )
      ),
    );
  }
}