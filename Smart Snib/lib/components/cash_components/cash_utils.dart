import 'package:flutter/material.dart';
import 'package:google_pay_ui/components/cash_components/all_activities.dart';
import 'package:google_pay_ui/components/cash_components/contacts.dart';
import 'package:google_pay_ui/components/cash_components/loader.dart';
import 'package:google_pay_ui/components/header_components/unlock_component/loader.dart';

class CashUtils extends StatelessWidget {
  String app_id;
  CashUtils(this.app_id);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.white
            ),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ActivitiesLoader(app_id)))
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.history,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Text(
                      "See all unlock activity",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                SizedBox(width: 100),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15, 
                  color: Colors.black,
                  )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Contacts()))
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(width: 20),
                Text(
                  "Contact Book ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(width: 140),
                Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
