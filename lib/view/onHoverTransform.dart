
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnHoverTransform extends StatefulWidget {

  final Widget Function(bool isHovered) builder;

  const OnHoverTransform({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverTransformState createState() => _OnHoverTransformState();
}

class _OnHoverTransformState extends State<OnHoverTransform> {

  var isHovered = false.obs;
  @override
  Widget build(BuildContext context) {

    final hovered = Matrix4.identity()..translate(0,-10,0);
    // final transform = isHovered.value ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_)=> onEntered(true),
      onExit: (_)=> onEntered(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // transform: transform,
          child: widget.builder(isHovered.value)
      ),
    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered.value = isHovered;
    });
  }
}