import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('注册页面'),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
