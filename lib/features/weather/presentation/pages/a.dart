import 'package:flutter/material.dart';
import 'package:weather/core/constants/logger.dart';

class A extends StatefulWidget {
  const A({super.key});

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: B(),
    );
  }
}

class B extends StatefulWidget {
  const B({super.key});

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late double _pos;
  @override
  void initState() {
    _pos = 0;
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = Tween<double>(
      begin: 0.0,
      end: 50.0,
    ).animate(_animationController);
    _animationController.forward();
    _animation.addListener(_animationListener);
    super.initState();
  }

  _animationListener() {
    setState(() {
      _pos = _animation.value;
      logger.i(_pos);
    });
    if (_animation.status == AnimationStatus.completed) {
      _animationController.stop();
    }
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController a = ScrollController();
    return Center(
      child: Stack(
        children: [
          const Positioned(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Card(
                color: Colors.red,
              ),
            ),
          ),
          AnimatedPositioned(
            left: _pos,
            duration: _animationController.duration!,
            child: SizedBox(
              height: 150,
              width: 50,
              child: ColoredBox(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          ListView.builder(itemBuilder: (context, index) {
            return Card();
          })
        ],
      ),
    );
  }
}
