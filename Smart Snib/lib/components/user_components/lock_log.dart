import 'package:flutter/material.dart';

class Lock_Log extends StatefulWidget {
  List<String> time, date, openby;
  String id;
  Lock_Log(this.time, this.date, this.openby,this.id);

  @override
  _Lock_LogState createState() => _Lock_LogState(time, date, openby,id);
}

class _Lock_LogState extends State<Lock_Log> {
  List<String> time, date, openby;
  String id ;
  _Lock_LogState(this.time, this.date, this.openby, this.id);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text(
          "$id",
          style: TextStyle(
            color:Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListView.builder(
          itemCount: date.length,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
              child: Container(
                  width: 10,
                  height: 120,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0.0, 3.0), //(x,y)
                        blurRadius: 4.0,
                        spreadRadius: 0,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Access by:",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            "${openby[index]}",
                            style: TextStyle(
                              fontSize: 25
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            IconTheme(
                              data: IconThemeData(color: Colors.green),
                              child: Icon(
                                Icons.verified_rounded
                              ),
                            ),
                            SizedBox(width: 10,),
                            
                            Text(
                              "${date[index]}",
                              style: TextStyle(
                                fontSize: 18
                              ),  
                            ),
                        
                            SizedBox(width: 10,),
                            
                            IconTheme(
                              data: IconThemeData(
                                size: 7
                              ),
                              child:Icon(Icons.circle)
                            ),
                            
                            SizedBox(width: 10,),
                        
                            Text(
                              "${time[index]}",
                              style: TextStyle(
                                fontSize: 18
                              ),  
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ),
            );
          }
        ),
      ),
    );
  }
}