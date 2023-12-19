import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Success Rejester ',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.green,
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
