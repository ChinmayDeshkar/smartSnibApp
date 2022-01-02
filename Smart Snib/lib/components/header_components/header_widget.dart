import 'package:flutter/material.dart';
import 'unlock_component/qrModel.dart';

class HeaderWidget extends StatelessWidget {
  String app_id;
  HeaderWidget(this.app_id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: GestureDetector(
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: 
                (BuildContext context){return Scanner(app_id);}));
                },
            child: Icon(
              Icons.center_focus_weak,
              color: Colors.white,
             ),
            ),
          ),
          // CircleAvatar(
          //   child: Icon(Icons.people),
          // ),
        ],
      ),
    );
  }
}
