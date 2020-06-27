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
                color: Colors.white,
                child: Center(
                  child: FractionallySizedBox(
                    child: Image.asset('assets/images/mark.png'),
                    widthFactor: 0.4,
                    heightFactor: 0.4,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: '请输入邮箱',
                              labelText: '邮箱',
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '请输入六位以上的密码',
                              labelText: '密码',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12),
                      child: Container(
                        child: Text('登录按钮'),
                        color: Colors.brown,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('没有账号？'),
                            Text('立即注册'),
                          ],
                        ),
                        color: Colors.brown,
                      ),
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
