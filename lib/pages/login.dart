import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text('邮箱'),
                          color: Colors.brown,
                        ),
                        Container(
                          child: Text('密码'),
                          color: Colors.brown,
                        ),
                      ],
                    ),
                    Container(
                      child: Text('登录按钮'),
                      color: Colors.brown,
                    ),
                    Container(
                      child: Text('注册提示'),
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
