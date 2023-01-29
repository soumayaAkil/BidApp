import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../config.dart';
import '../home.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  List<Asset> images = [];
  Dio dio = Dio();
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 7,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future offreAdd() async {


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          title: Row(children: [
            Image.asset(
              "images/succe.gif",
              width: 90,
              height: 70,
              fit: BoxFit.contain,
            ),
            Text('Succès ! ',
                style: TextStyle(
                  color: Colors.purple,
                )),
          ]),
          content: Text(
            "Offre ajouter avec succées",
            style: TextStyle(
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: new Text("OK",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
    /* else {
      setState(() {
        visible = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            title: Row(children: [
              Image.asset(
                "images/error.gif",
                width: 90,
                height: 60,
                fit: BoxFit.contain,
              ),
              Text(
                'Oops !!!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.redAccent,
                ),
              ),
            ]),
            content: new Text(
              "Invalid Username or Password Please Try Again",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text("Close",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
     */
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }
  /*
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }
  */

  _saveImage() async {
    if (images != null) {
      late List<MultipartFile> imagestoEdit = [];
      /*
      var formData = FormData.fromMap({
      'name': name,
      'desc': desc,
      'address': address,
      'files': [
        for (var item in images)
          {
            await MultipartFile.fromFile(item.path,
                filename: basename(item.path))
          }.toList()
      ],
    });
       */
      for (var i = 0; i < images.length; i++) {

        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        List<MultipartFile> MLF = <MultipartFile>[];
        MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          filename: images[i].name,
          contentType: MediaType('image', 'jpg'),
        );
        print("ddd");
        print(multipartFile);
        imagestoEdit.add(multipartFile);
        MLF.add(multipartFile);
        FormData fromData = FormData.fromMap({
          "upload": multipartFile,

        });
        var reponse = await dio.post(
          UPLOAD_URL,
          data: fromData,
            options: Options(contentType: 'multipart/form-data',
                followRedirects: false,
                validateStatus: (status) { return status < 500;}

            )
        );
        print("sssssssssssssssssssss");
        print(imagestoEdit.length);

        if (reponse.statusCode == 200) {
          print("dddd");
        }
      }
      }

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: loadAssets,
            child: Text("Picked Image"),
          ),
          Expanded(
            child: buildGridView(),
          ),
          ElevatedButton(
            onPressed: () {
              _saveImage();

              offreAdd();
            },
            //_saveImage(),

            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
