import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterPageArgument argument =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('注册页面，从${argument.className}-${argument.url}跳转而来'),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
