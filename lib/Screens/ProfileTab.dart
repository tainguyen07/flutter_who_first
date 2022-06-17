import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final picker = ImagePicker();
  Future<PickedFile> pickedFile = Future.value(null);
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
        ),
        new ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: new MyClipper(),
          child: new Container(
            height: MediaQuery.of(context).size.height * 0.725,
            decoration: new BoxDecoration(color: Colors.white, boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  offset: new Offset(1.0, 10.0),
                  blurRadius: 10.0)
            ]),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  flex: 4,
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(height: ScreenUtil().setHeight(50.0)),
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: RawMaterialButton(
                            onPressed: () {
                              pickedFile = picker
                                  .getImage(source: ImageSource.gallery)
                                  .whenComplete(() => {setState(() {})});
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: FutureBuilder<PickedFile>(
                              future: pickedFile,
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  return Container(
                                    height: ScreenUtil().setHeight(350.0),
                                    width: ScreenUtil().setWidth(430.0),
                                    child: Image.file(
                                      File(snap.data.path),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.white,
                                  );
                                }
                                return Container(
                                  height: ScreenUtil().setHeight(350.0),
                                  width: ScreenUtil().setWidth(430.0),
                                  color: Colors.blueAccent,
                                );
                              },
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(10.0)),
                        new Text(
                          "Abhishek, 19",
                          style: new TextStyle(
                              letterSpacing: 1.1,
                              fontSize: ScreenUtil().setSp(70),
                              fontWeight: FontWeight.w400),
                        ),
                        new Expanded(
                            child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    width: ScreenUtil().setWidth(165.0),
                                    height: ScreenUtil().setHeight(140.0),
                                    decoration: new BoxDecoration(
                                        color: Colors.blueGrey.shade50,
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: new Icon(
                                      Icons.settings,
                                      size: ScreenUtil().setSp(100),
                                      color: Colors.blueGrey.shade200,
                                    ),
                                  ),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10.0)),
                                  new Text(
                                    "SETTINGS",
                                    style: new TextStyle(
                                        color: Colors.blueGrey.shade200,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            new Expanded(
                                child: new Stack(
                              children: <Widget>[
                                new Container(
                                  color: Colors.white,
                                ),
                                new Positioned(
                                  right: 1.0,
                                  bottom: 0.0,
                                  left: 1.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Container(
                                        width: ScreenUtil().setHeight(160),
                                        height: ScreenUtil().setHeight(160),
                                        decoration: new BoxDecoration(
                                            gradient: new LinearGradient(
                                                colors: [
                                                  Theme.of(context).accentColor,
                                                  Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  Theme.of(context).primaryColor
                                                ],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                stops: [0.0, 0.35, 1.0]),
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(150.0)),
                                        child: new Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: ScreenUtil().setSp(125.0),
                                        ),
                                      ),
                                      new SizedBox(
                                          height: ScreenUtil().setHeight(10.0)),
                                      new Text(
                                        "ADD MEDIA",
                                        style: new TextStyle(
                                            color: Colors.blueGrey.shade200,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                new Positioned(
                                  right: ScreenUtil().setWidth(80.0),
                                  bottom: ScreenUtil().setWidth(62.0),
                                  child: new Container(
                                    width: ScreenUtil().setHeight(50),
                                    height: ScreenUtil().setHeight(50),
                                    decoration: new BoxDecoration(
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.grey,
                                            offset: new Offset(2.0, 3.0),
                                            blurRadius: 5.0,
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            new BorderRadius.circular(25)),
                                    child: Center(
                                      child: new Icon(
                                        Icons.add,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                            new Expanded(
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    width: ScreenUtil().setWidth(165.0),
                                    height: ScreenUtil().setHeight(140.0),
                                    decoration: new BoxDecoration(
                                        color: Colors.blueGrey.shade50,
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: new Icon(
                                      Icons.edit,
                                      size: ScreenUtil().setSp(100),
                                      color: Colors.blueGrey.shade200,
                                    ),
                                  ),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10.0)),
                                  new Text(
                                    "EDIT INFO",
                                    style: new TextStyle(
                                        color: Colors.blueGrey.shade200,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                new Expanded(flex: 3, child: new Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final Shader linearGradient = new LinearGradient(
        colors: [Colors.amber.shade800, Colors.amber.shade600],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.0, 1.0])
    .createShader(Rect.fromLTWH(
        0.0, 0.0, ScreenUtil().setWidth(30), ScreenUtil().setHeight(20)));

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(0, size.height - ScreenUtil().setHeight(200));
    Offset controlPoint = new Offset(size.width / 2, size.height);
    p.quadraticBezierTo(controlPoint.dx, controlPoint.dy, size.width,
        size.height - ScreenUtil().setHeight(200));
    //p.lineTo(size.width,size.height - ScreenUtil().setHeight(200) );
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
