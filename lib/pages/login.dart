import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // 利用 Expanded 来让两个 child 组件占满整个屏幕
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text('top'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text('bottom'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
