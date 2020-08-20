import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:TeamWorkPrototype/pages/drawer_menu.dart';
import 'package:TeamWorkPrototype/styles/raisedDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeamWorkManageProjectPage extends StatefulWidget {
  TeamWorkManageProjectPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkManageProjectPageState createState() =>
      _TeamWorkManageProjectPageState();
}

class _TeamWorkManageProjectPageState extends State<TeamWorkManageProjectPage>
    with TickerProviderStateMixin {
  MenuController menuController;

  final List<ManageProjectItem> options = [
    ManageProjectItem('주니어 소프트웨어 창작대회'),
    ManageProjectItem('학교 창의 체험의 날 준비'),
    ManageProjectItem('국어 글쓰기 수행평가'),
    ManageProjectItem('미적분 실생활 속 미적분의 쓰임'),
    ManageProjectItem('기하 실생활 속 기하의 쓰임'),
    ManageProjectItem('독서 읽토쓰'),
  ];

  void alertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("취소"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget editButton = FlatButton(
      child: Text("수정"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("삭제"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget detailButton = FlatButton(
      child: Text("보기"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var alert = AlertDialog(
      title: Text("작업 선택"),
      content: Text("어떠한 작업을 할까요?"),
      actions: [editButton, deleteButton, detailButton, cancelButton],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
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
        headerText: "현재 참가되어 있거나\n생성한 프로젝트들의\n목록 입니다.",
        menuScreen: MenuScreen(),
        contentScreen: Layout(
          contentBuilder: (cc) => Container(
            child:
                // Main content is go here
                SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options.map(
                  (item) {
                    return ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onTap: () => {alertDialog(context)},
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ManageProjectItem {
  String title;

  ManageProjectItem(this.title);
}
