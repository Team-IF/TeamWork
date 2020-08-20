import 'package:TeamWorkPrototype/icons/logo.dart';
import 'package:TeamWorkPrototype/styles/raisedDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamWorkLoginPage extends StatefulWidget {
  TeamWorkLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkLoginPageState createState() => _TeamWorkLoginPageState();
}

class _TeamWorkLoginPageState extends State<TeamWorkLoginPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color(0XFF3F51b5),

      // persist create account link at the bottom of screen
      bottomNavigationBar: _createAccountLink(),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 75,
            ),
            _topheader(),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.grey[50],
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40),
                      _labelText('이메일:'),
                      _inputTextField('example@email.com', false),
                      SizedBox(height: 16),
                      _labelText('비밀번호:'),
                      _inputTextField('*********', true),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            //TODO
                            // Do Nothing
                          },
                          child: Text(
                            '비밀번호를 잊었나요?',
                            style: TextStyle(
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 46,
                          width: 160,
                          child: RaisedButton(
                            onPressed: () {
                              //TODO
                              // Do Nothing
                            },
                            child: Text(
                              '로그인',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            color: Color(0XFF303f9f),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '또는',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _loginSocialMediaBtn(TeamWorkCustomIcons.kakaoLogo,
                              kakaoBackgroundColor, Color(0xFF3B1E1E)),
                          SizedBox(width: 16),
                          _loginSocialMediaBtn(TeamWorkCustomIcons.naverLogo,
                              naverBackgroundColor, Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createAccountLink() {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.only(bottom: 16),
      height: 60,
      child: Center(
        child: Text(
          '계정이 없나요? 여기를 눌러 가입하세요.',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  //button to login in using scial media,
  _loginSocialMediaBtn(IconData icon, Color bgColor, Color iconColor) {
    return SizedBox.fromSize(
      size: Size(54, 54), //button width and height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          elevation: 16,
          shadowColor: Colors.black,
          color: bgColor,
          child: InkWell(
            splashColor: Colors.white12,
            onTap: () {},
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _inputTextField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          obscureText: obscuretext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _labelText(title) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  _topheader() {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Team Work\n계정으로\n진행하기',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          // Image.asset(
          //   'assets/gbimage.png',
          //   height: 170,
          //   fit: BoxFit.fitHeight,
          // )
        ],
      ),
    );
  }
}
