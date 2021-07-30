import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget? child;
  final Function? onTap;

  const BouncingButton({Key? key, this.child, this.onTap}) : super(key: key);
  @override
  _BouncingButtonState createState() => _BouncingButtonState(child, onTap);
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  final Widget? child;
  final Function? onTap;
  late double _scale;
  late AnimationController _controller;

  _BouncingButtonState(this.child, this.onTap);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 130),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (onTap != null) {
          onTap!();
        }

        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        Future.delayed(const Duration(milliseconds: 130), () {
          if (mounted) {
            _controller.reverse();
          }
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: child,
      ),
    );
  }
}
