import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:TeamWorkPrototype/pages/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeamWorkHomePage extends StatefulWidget {
  TeamWorkHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamWorkHomePageState createState() => _TeamWorkHomePageState();
}

class _TeamWorkHomePageState extends State<TeamWorkHomePage>
    with TickerProviderStateMixin {
  MenuController menuController;

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
        headerText: "\${user}님\n반갑습니다!",
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
                  Container(
                    padding: EdgeInsets.only(top: 250),
                    child: Center(
                      child: Text(
                        '저런! 아직 참여한 프로젝트가 없네요!\n우상단 메뉴에서 프로젝트를 만들거나 들어갈 수 있습니다.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[900],
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
