import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:TeamWorkPrototype/pages/drawer_menu.dart';
import 'package:TeamWorkPrototype/styles/raisedDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeamWorkAddProjectPage extends StatefulWidget {
  TeamWorkAddProjectPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkAddProjectPageState createState() => _TeamWorkAddProjectPageState();
}

class _TeamWorkAddProjectPageState extends State<TeamWorkAddProjectPage>
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
        headerText: "아래의 내용으로\n새로운 프로젝트 / 과제를\n생성하세요.",
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
                  _labelText('프로젝트 이름:'),
                  _inputTextField('ex) 주소창 방', false),
                  SizedBox(height: 16),
                  _labelText('참가 비밀번호:'),
                  _inputTextField('*********', true),
                  SizedBox(height: 16),
                  _labelText('참가 인원:'),
                  _inputTextField('4', false),
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
                          '생성하기',
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
