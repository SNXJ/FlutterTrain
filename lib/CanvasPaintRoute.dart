import 'package:flutter/material.dart';

//Error
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  @override
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(painter: new SignaturePainter(_points)),
    );
  }
}

class CanvasPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Canvas route',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new Signature(),
//    );
//  }
}

