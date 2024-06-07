import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_1/config/config.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<XFile> selectedAssets = [];
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }

  Widget _mainView() {
    return Scaffold(
        appBar: AppBar(
          centerTitle:  true,
          backgroundColor: Theme.of(context ).colorScheme.inversePrimary,
          title: Text('Post Page',style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [

            _buildPhotoList(),
          ],
        )
    );
  }

  Widget _buildPhotoList() {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      final double width = (constraints.maxWidth-PostImageConfig.spacing*2)/3;

      final children = <Widget>[];
      children.addAll(selectedAssets.map((image) {
        return  Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.file(
            File(image.path),
            fit: BoxFit.cover,
            width: width,
            height: width,
          ),
        );
      }));

      if (children.length < 9) {
        children.add(
          InkWell(
            onTap: onPickImage,
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),

              ),
              child: Icon(Icons.add, size: width * 0.3),
              alignment: Alignment.center,
            ),
          ),
        );
      }

      return Wrap(
        spacing: PostImageConfig.spacing,
        runSpacing: PostImageConfig.spacing,
        children: children,
      );
    });
  }

  void onPickImage() async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        selectedAssets.addAll(images);
      });
    }
  }
}