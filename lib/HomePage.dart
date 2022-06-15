import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinder_clone/Models/tinder_clone_icons.dart';
import 'package:tinder_clone/Screens/LoginScreen.dart';
import 'package:tinder_clone/Screens/MessagesTab.dart';
import 'package:tinder_clone/Screens/ProfileTab.dart';
import 'package:tinder_clone/Screens/TinderTab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    _tabcontroller = new TabController(length: 3, vsync: this);
    _tabcontroller.addListener(() {
      setState(() {});
    });
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text("Who First"),
              actions: <Widget>[
                MaterialButton(
                  child: Icon(Icons.logout, color: Colors.white),
                  onPressed: () async {
                    _signOut();
                  },
                )
              ],
            ),
            bottomNavigationBar: menu(),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabcontroller,
              children: <Widget>[
                new TinderTab(),
                new MessagesTab(),
                new ProfileTab(),
              ],
            )),
      ),
    );
  }

  Widget menu() {
    return SizedBox(
      height: 80,
      child: Container(
        color: Colors.transparent,
        child: TabBar(
            controller: _tabcontroller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.transparent,
            tabs: [
              SafeArea(
                child: new Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                  child: Center(
                    child: new Icon(
                      Tinder_clone.iconfinder_338_tinder_logo_4375488__1_,
                      color: _tabcontroller.index == 0
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: ScreenUtil().setSp(80.0),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: new Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                  child: Center(
                    child: new Icon(
                      Tinder_clone.iconfinder_message_01_186393,
                      color: _tabcontroller.index == 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: ScreenUtil().setSp(80.0),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: new Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                  child: Center(
                    child: new Icon(
                      Tinder_clone.iconfinder_icons_user2_1564535,
                      color: _tabcontroller.index == 2
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: ScreenUtil().setSp(80.0),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
