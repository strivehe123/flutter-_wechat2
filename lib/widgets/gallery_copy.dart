import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {

  final String imagePath;

  ImageViewPage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      )  ,
      body: Container(
        color:  Colors.black,
        child: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
          child: ExtendedImage.file(
              File(imagePath),
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
            );
          },
        ),
          ),
        ),
      ),
    );
  }
}