import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_pay_ui/components/separator.dart';
import 'business_components/business_banner.dart';
import 'cash_components/cash_utils.dart';
import 'header_components/business_header.dart';
import 'header_components/header_widget.dart';
import 'header_components/people_header.dart';
import 'header_components/promotion_header.dart';
import 'header_components/scroll_handle.dart';
import 'invite_components/invite_section.dart';
import 'promotion_components/promotion_data.dart';
import 'user_components/load_more.dart';
import 'user_components/userDetails.dart';

class GooglePayHome extends StatefulWidget {
  String app_id;
  GooglePayHome(this.app_id);
  @override
  _GooglePayHomeState createState() => _GooglePayHomeState(app_id);
}

class _GooglePayHomeState extends State<GooglePayHome> {

  String app_id;
  _GooglePayHomeState(this.app_id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: Stack(
          children: [
            HeaderWidget(app_id),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 90, horizontal: 90),
              child: Container(
                
                child:Image.asset(
                  "assets/SmartSnib.png",
                )
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController myScrollController) {
                return ListView.builder(
                  controller: myScrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          ScrollHandle(),
                          SizedBox(height: 20),
                          PeopleHeader(),
                          
                          SizedBox(height: 20),
                          UserDetails(controller: myScrollController),
                         
                          SizedBox(height: 30),
                          Separator(),
                          SizedBox(height: 50),
                          CashUtils(app_id),
                          SizedBox(height: 50),
                          
                          InviteSection(),
                          Container(
                            child: Image.asset("assets/footer.png"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
