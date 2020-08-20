import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:TeamWorkPrototype/pages/drawer_menu.dart';
import 'package:TeamWorkPrototype/styles/raisedDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeamWorkJoinProjectPage extends StatefulWidget {
  TeamWorkJoinProjectPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkJoinProjectPageState createState() =>
      _TeamWorkJoinProjectPageState();
}

class _TeamWorkJoinProjectPageState extends State<TeamWorkJoinProjectPage>
    with TickerProviderStateMixin {
  MenuController menuController;

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

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(
        () => setState(
          () {},
        ),
      );
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomableScaffold(
        headerText: "아래의 내용을 채워서\n새로운 프로젝트 / 과제에\n참가하세요.",
        menuScreen: MenuScreen(),
        contentScreen: Layout(
          contentBuilder: (cc) => Container(
            child:
                // Main content is go here
                SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  _labelText('프로젝트 ID:'),
                  _inputTextField('ex) 주소창 방', false),
                  SizedBox(height: 16),
                  _labelText('참가 비밀번호:'),
                  _inputTextField('*********', true),
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
                          '참가하기',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
