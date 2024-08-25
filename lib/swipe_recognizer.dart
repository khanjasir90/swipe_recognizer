library swipe_recognizer;

import 'package:flutter/widgets.dart';

class SwipeRecognizer extends StatefulWidget {
  const SwipeRecognizer({
    super.key,
    this.onSwipeLeft,
    this.onSwipeRight,
    required this.child,
  });

  final void Function()? onSwipeLeft;

  final void Function()? onSwipeRight;

  final Widget child;

  @override
  State<SwipeRecognizer> createState() => _SwipeRecognizerState();
}

class _SwipeRecognizerState extends State<SwipeRecognizer> {

  Offset initialOffset = Offset.zero;
  Offset dragOffset = Offset.zero;

  void _decideSwipe() {
    if(initialOffset.dx == dragOffset.dx) return;
    if (initialOffset.dx < dragOffset.dx) {
      widget.onSwipeRight?.call();
    } else {
      widget.onSwipeLeft?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        initialOffset = details.localPosition;
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        dragOffset = details.localPosition;
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        dragOffset = details.localPosition;
        _decideSwipe();
      },
      child: widget.child,
    );
  }
}
