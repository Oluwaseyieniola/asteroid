import 'package:flutter/material.dart';

class TopToBottomAnimation extends StatefulWidget {
  @override
  _TopToBottomAnimationState createState() => _TopToBottomAnimationState();
}

class _TopToBottomAnimationState extends State<TopToBottomAnimation>
    with SingleTickerProviderStateMixin {
  final Tween<Offset> _offsetTween = Tween(
    begin: Offset(0, -1),
    end: Offset(0, 1),
  );
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 22),
    vsync: this,
  );
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animation = _offsetTween.animate(_controller..repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: _animation.value * MediaQuery.of(context).size.height,
              child: child,
            );
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/comet.png'))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
