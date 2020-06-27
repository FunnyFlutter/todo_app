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
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 12,
                        bottom: 12,
                      ),
                      child: FlatButton(
                        child: Text(
                          '登录',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        disabledColor: Color.fromRGBO(69, 202, 160, 0.5),
                        color: Color.fromRGBO(69, 202, 181, 1),
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
                            InkWell(
                              child: Text('立即注册'),
                              onTap: () {},
                            ),
                          ],
                        ),
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
