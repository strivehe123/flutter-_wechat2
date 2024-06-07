import 'package:flutter/material.dart';

class SildeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final AnimationController animationController;
  final bool visible ;
  const SildeAppBarWidget({Key? key, required this.child, required this.animationController, required this.visible}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    visible ? animationController.reverse() : animationController.forward();
    return SlideTransition(position:
    Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -1)).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.fastOutSlowIn)), child: child);

  }
}