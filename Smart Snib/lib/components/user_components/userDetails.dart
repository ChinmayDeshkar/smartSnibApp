import 'package:flutter/material.dart';
// import 'lock_log.dart';
import 'package:google_pay_ui/model/userModel.dart';
import 'user_loader.dart';

class UserDetails extends StatelessWidget {
  final ScrollController controller;

  const UserDetails({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 4,
        controller: controller,
        itemBuilder: (context, i) {
          return GridTile(
            child: Column(
              children: [
                 GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoaderScreen(dummyData[i].name)));
                },
                child: CircleAvatar(
                 child: Container(
                  child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                  child:Image.asset(
                       "assets/lock_img.png",
                       fit: BoxFit.contain,
                      ),
                     ),
                   ),
                  radius: 25,
                ),
              ),
              SizedBox(height: 10),
                Text(
                  dummyData[i].name,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
