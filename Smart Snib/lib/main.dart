import 'package:flutter/material.dart';
import 'components/header_components/unlock_component/lock_dashboard.dart';
import 'components/google_pay_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GooglePayHome('ae001'),
    );
  }
}
