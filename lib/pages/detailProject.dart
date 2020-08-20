import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:TeamWorkPrototype/pages/drawer_menu.dart';
import 'package:TeamWorkPrototype/styles/raisedDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class TeamWorkDetailProjectPage extends StatefulWidget {
  TeamWorkDetailProjectPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkDetailProjectPageState createState() =>
      _TeamWorkDetailProjectPageState();
}

class _TeamWorkDetailProjectPageState extends State<TeamWorkDetailProjectPage>
    with TickerProviderStateMixin {
  MenuController menuController;

  void alertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("취소"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = FlatButton(
      child: Text("확인"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    var alert = AlertDialog(
      title: Text("내 작업 진행도 수정"),
      content: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: '작업 진행도 입력 (퍼센트)'),
      ),
      actions: [cancelButton, okButton],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
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

  _progressView(name, double percent) {
    var color;
    if (percent < 0.3) color = Colors.red;
    if (percent >= 0.3 && 0.6 >= percent) color = Colors.orange;
    if (percent > 0.6) color = Colors.blue;
    return Column(
      children: <Widget>[
        SizedBox(height: 8),
        Text(name),
        SizedBox(height: 6),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width / 1.35,
          animation: true,
          lineHeight: 20.0,
          animationDuration: 2500,
          percent: percent,
          center: Text("${percent * 100}%"),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: color,
        ),
      ],
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

  _memberText(title) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
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
        headerText: "현재\n\${projName}\n의 진행상황 입니다.",
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
                  _labelText('진행률:'),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    decoration: raisedDecoration,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: _progressView('디자인', 0.87),
                          ),
                          _progressView('서버', 0.59),
                          _progressView('Database', 1),
                          _progressView('Testflight', 0.2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _labelText('참가자:'),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    decoration: raisedDecoration,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 4),
                          _memberText('임꺽정'),
                          SizedBox(height: 4),
                          _memberText('홍길동'),
                          SizedBox(height: 4),
                          _memberText('장영실(나)'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _labelText('공유된 마크다운 목록:'),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    decoration: raisedDecoration,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 4),
                          _memberText('server_structure.md'),
                          SizedBox(height: 4),
                          _memberText('Bug_List.md'),
                          SizedBox(height: 4),
                          _memberText('디자인 패드백 요청.md'),
                          SizedBox(height: 4),
                          _memberText('Database 구조.md'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 46,
                      child: RaisedButton(
                        onPressed: () {
                          alertDialog(context);
                        },
                        child: Text(
                          '내 실적 제출하기',
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
