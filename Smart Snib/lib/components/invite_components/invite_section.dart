import 'package:flutter/material.dart';

class InviteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.blue[50]),
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "This app is not meant to share!",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Only authorised person can keep this application.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
