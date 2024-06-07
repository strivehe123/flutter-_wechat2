import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class ImageViewPage extends StatefulWidget {
  final String imagePath;

  ImageViewPage(this.imagePath);

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SildeAppBarWidget(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)
        ),
        animationController: _animationController,
        visible: _visible,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _visible = !_visible;
                _visible ? _animationController.reverse() : _animationController.forward();
              });
            },
            child: ExtendedImage.file(
              File(widget.imagePath),
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