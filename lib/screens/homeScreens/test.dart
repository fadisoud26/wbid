import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/icon_constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/widgets/material_widget.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  static const String id = 'test';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<File>? _images = [];
  bool v = true;
  void _check() {
    (_images == null) ? v = true : v = false;
  }

  Future pickImage(ImageSource source) async {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        _images!.add(imageTemporary);
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        elevation: 0,
        backgroundColor: Colors.white,
        title: sellingText,
        leading: IconButton(
          onPressed: () {
            setState(() {
             _check(); 
            });
            
          },
          icon: const Icon(Icons.cancel),
          color: Colors.black,
          iconSize: 25,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: photoCameraIcon,
                ),
                IconButton(
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  icon: photoIcon,
                ),
              ],
            ),
            sBoxH20,
            v
                ? const Text('df')
                : Expanded(
                    child: GridView.builder(
                        itemCount: _images!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return ImageGallery(
                            imagePath: _images![index].path,
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  ImageGallery({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  dynamic imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialWidget(
        margin: 5,
        materialChild: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

