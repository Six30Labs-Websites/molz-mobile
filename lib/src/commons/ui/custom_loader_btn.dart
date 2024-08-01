import 'dart:ui';

import 'package:flutter/material.dart';

enum ButtonState { loading, idle }

class CustomLoadingBtn extends StatefulWidget {
  final double height;
  final double width;
  final double minWidth;
  final Widget? loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function(
      Function startLoading, Function stopLoading, ButtonState btnState)? onTap;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double? disabledElevation;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool animate;

  const CustomLoadingBtn({
    super.key,
    required this.height,
    required this.width,
    this.minWidth = 0,
    this.loader,
    this.animationDuration = const Duration(milliseconds: 450),
    this.curve = Curves.easeInOutCirc,
    this.reverseCurve = Curves.easeInOutCirc,
    required this.child,
    this.onTap,
    this.color,
    this.elevation,
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = 0.0,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.materialTapTargetSize,
    this.roundLoadingShape = true,
    this.borderSide = const BorderSide(color: Colors.transparent, width: 0),
    this.disabledElevation,
    this.disabledColor,
    this.disabledTextColor,
    this.animate = false,
  });

  @override
  State<CustomLoadingBtn> createState() => _CustomLoadingBtnState();
}

class _CustomLoadingBtnState extends State<CustomLoadingBtn> with TickerProviderStateMixin {
  double? loaderWidth;
  late Animation<double> _animation;
  late AnimationController _controller;
  ButtonState btn = ButtonState.idle;

  final GlobalKey _buttonKey = GlobalKey();
  double _minWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ButtonState.idle;
        });
      }
    });
    _minWidth = widget.height;
    loaderWidth = widget.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ButtonState.loading;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  lerpWidth(a, b, t) {
    if (a == 0.0 || b == 0.0) {
      return null;
    } else {
      return a + (b - a) * t;
    }
  }

  double get minWidth => _minWidth;

  set minWidth(double w) {
    if (widget.minWidth == 0) {
      _minWidth = w;
    } else {
      _minWidth = widget.minWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return buttonBody();
      },
    );
  }

  Widget buttonBody() {
    return SizedBox(
      height: widget.height,
      width: widget.animate
          ? lerpWidth(widget.width, minWidth, _animation.value)
          : widget.width,
      child: ElevatedButton(
        key: _buttonKey,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: widget.borderSide,
              borderRadius: BorderRadius.circular(
                widget.roundLoadingShape
                    ? lerpDouble(widget.borderRadius, widget.height / 2,
                    _animation.value)!
                    : widget.borderRadius,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(widget.color),
          elevation: MaterialStateProperty.all<double?>(widget.elevation),
          padding:
          MaterialStateProperty.all<EdgeInsetsGeometry>(widget.padding),
        ),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        onPressed: () {
          widget.onTap!(() => animateForward(), () => animateReverse(), btn);
        },
        child: btn == ButtonState.idle ? widget.child : widget.loader,
      ),
    );
  }
}

class LoaderBounce extends StatefulWidget {
  const LoaderBounce({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
  'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _LoaderBounceState createState() => _LoaderBounceState();
}

class _LoaderBounceState extends State<LoaderBounce> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _animation = Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: List.generate(2, (i) {
          return Transform.scale(
            scale: (1.0 - i - _animation.value.abs()).abs(),
            child: SizedBox.fromSize(size: Size.square(widget.size), child: _itemBuilder(i)),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color!.withOpacity(0.6)));
}



//
class Employee {
  // Private property
  var _name;

  // Getter method to access private property _name
  String getName() {
    return _name;
  }

  // Setter method to update private property _name
  void setName(String name) {
    _name = name;
  }
}

// void main() {
//   var employee = Employee();
//   employee._name = "John"; // It is working, but why?
//   print(employee.getName());
// }
