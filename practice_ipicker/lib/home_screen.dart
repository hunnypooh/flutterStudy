import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // DecorationImage showImage() {
  //   if (_image == null) {
  //     return DecorationImage(
  //         image: NetworkImage('https://picsum.photos/250?image=9'));
  //   } else {
  //     return DecorationImage(image: FileImage(File(_image!.path)));
  //   }
  // }

  Image showImage() {
    if (_image == null) {
      return Image.network('https://picsum.photos/250?image=9');
    } else {
      return Image.file(File(_image!.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green,
            image: DecorationImage(
              image: showImage().image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.wallpaper),
        onPressed: () {
          getImage(ImageSource.gallery);
        },
      ),
    );
  }
}
