import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  final GlobalKey<DrawerControllerState> _drawerKey = GlobalKey<DrawerControllerState>();
  @override
  Widget build(BuildContext context) {
    final RenderBox box = _drawerKey.currentContext?.findRenderObject();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TRIVIA 360"),
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
              if (_drawerKey.currentState){
                _scaffoldKey.currentState.openDrawer();
              }
            })
          ),
          body: Scaffold(
            key: _scaffoldKey,
            drawer: new Drawer(
              key: _drawerKey,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                    )
                  )
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}
