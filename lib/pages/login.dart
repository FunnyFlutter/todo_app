import 'package:flutter/material.dart';

import 'package:todo_list/const/route_url.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool canLogin;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    canLogin = false;
  }

  void _checkInputValid(String _) {
    // 这里的参数写成 _ 是表示在这里我们没有使用这个参数，这是一种比较约定俗称的写法
    bool isInputValid = _emailController.text.contains('@') &&
        _passwordController.text.length >= 6;
    if (isInputValid == canLogin) {
      return;
    }
    setState(() {
      canLogin = isInputValid;
    });
  }

  void _gotoRegister() {
    Navigator.of(context).pushNamed(REGISTER_PAGE_URL);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            //利用MediaQuery来获取屏幕的高度
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
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
                            padding: EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '请输入邮箱',
                                    labelText: '邮箱',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (String value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  onChanged: _checkInputValid,
                                  controller: _emailController,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '请输入六位以上的密码',
                                    labelText: '密码',
                                  ),
                                  obscureText: true,
                                  onChanged: _checkInputValid,
                                  controller: _passwordController,
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
                              onPressed: canLogin ? () {} : null,
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
                                    onTap: _gotoRegister,
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
          ),
        ),
      ),
    );
  }
}
