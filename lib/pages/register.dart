import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool canRegister;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    canRegister = false;
  }

  void _checkInputValid(String _) {
    bool isInputValid = _emailController.text.contains('@') &&
        _passwordController.text.length >= 6 &&
        _passwordController.text == _repeatPasswordController.text;
    if (isInputValid == canRegister) {
      return;
    }
    setState(() {
      canRegister = isInputValid;
    });
  }

  void _gotoLogin() {}

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
                          child: Container(),
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
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (String value) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  obscureText: true,
                                  onChanged: _checkInputValid,
                                  controller: _passwordController,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '再次输入密码',
                                    labelText: '确认密码',
                                  ),
                                  obscureText: true,
                                  onChanged: _checkInputValid,
                                  controller: _repeatPasswordController,
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
                              onPressed: canRegister ? () {} : null,
                              child: Text(
                                '注册并登录',
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
                                  Text('已有账号？'),
                                  InkWell(
                                    child: Text('立即登录'),
                                    onTap: _gotoLogin,
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