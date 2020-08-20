import 'package:TeamWorkPrototype/holder/circularImage.dart';
import 'package:TeamWorkPrototype/holder/zoomableScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://image.flaticon.com/icons/png/512/21/21104.png";

  final List<MenuItem> options = [
    MenuItem(Icons.input, '프로젝트 / 과제 참가'),
    MenuItem(Icons.add, '프로젝트 / 과제 만들기'),
    MenuItem(Icons.format_list_bulleted, '프로젝트 / 과제 보기 / 관리'),
    MenuItem(Icons.folder_shared, '마크다운 공유함'),
    MenuItem(Icons.code, '마크다운 변경 기록'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0XFF3F51b5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  '\$\{user\}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: options.map(
                      (item) {
                        return ListTile(
                          leading: Icon(
                            item.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('설정',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.info,
                color: Colors.white,
                size: 20,
              ),
              title: Text('정보',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
