import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_clone/Screens/EditProfile.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final picker = ImagePicker();
  Future<PickedFile> pickedFile = Future.value(null);
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
            ),
          ),
          child: Text('Edit Profile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfile()),
            );
          },
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        )
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
