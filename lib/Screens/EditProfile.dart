import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final picker = ImagePicker();
  Future<PickedFile> pickedFile = Future.value(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          actions: <Widget>[
            new ShaderMask(
                child: IconButton(
                    icon: Icon(Icons.save_as_outlined), onPressed: () {}),
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 1.0]).createShader(bounds);
                }),
          ],
          leading: new ShaderMask(
              child: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 1.0]).createShader(bounds);
              }),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              new SizedBox(height: ScreenUtil().setHeight(30.0)),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: new Text(
                      "Name",
                    ),
                  ),
                  Expanded(
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name name',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      "Gender",
                    ),
                  ),
                  Expanded(
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name name',
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
