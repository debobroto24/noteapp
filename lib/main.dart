import 'package:flutter/material.dart';
import 'package:noteapp/view/home_page.dart';
import 'dart:ui';
import 'dart:math' as math;
// void main() {
//   runApp(const MyApp());
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch:Colors.blueGrey,
//       ),
//       home:  HomePage(),
//     );
//   }
// }





// void main() {
//   runApp(MyApp());
// }

// class ColorMovingBox extends StatefulWidget {
//   @override
//   _ColorMovingBoxState createState() => _ColorMovingBoxState();
// }

// class _ColorMovingBoxState extends State<ColorMovingBox>
//     with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
//  late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3), // You can adjust the duration as needed
//     )..repeat(reverse: true); // Repeat the animation in reverse as well to create a back-and-forth effect

//     _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
//         .animate(_controller); // Change the begin and end colors as desired
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _colorAnimation,
//       builder: (context, child) {
//         return Container(
//           width: 200,
//           height: 200,
//           color: _colorAnimation.value,
//         );
//       },
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Color Moving Box Animation'),
//         ),
//         body: Center(
//           child: ColorMovingBox(),
//         ),
//       ),
//     );
//   }
// }








// void main() {
//   runApp(MyApp());
// }

// class SwirlingBoxAnimation extends StatefulWidget {
//   @override
//   _SwirlingBoxAnimationState createState() => _SwirlingBoxAnimationState();
// }

// class _SwirlingBoxAnimationState extends State<SwirlingBoxAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CustomPaint(
//         painter: SwirlingPainter(
//           animation: _controller,
//           strokeWidth: 4.0,
//           swirlColor: Colors.red,
//         ),
//         size: Size(200, 200), // Adjust the size as needed
//       ),
//     );
//   }
// }

// class SwirlingPainter extends CustomPainter {
//   final Animation<double> animation;
//   final double strokeWidth;
//   final Color swirlColor;

//   SwirlingPainter({
//    required this.animation,
//    required this.strokeWidth,
//    required this.swirlColor,
//   }) : super(repaint: animation);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double center = size.width / 2;
//     final double radius = size.width / 2 - strokeWidth / 2;
//     final double angle = animation.value * 2 * math.pi;

//     Paint paint = Paint()
//       ..color = swirlColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

//     canvas.drawArc(
//       Rect.fromCircle(center: Offset(center, center), radius: radius),
//       angle,
//       1.5 * math.pi,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Swirling Box Animation'),
//         ),
//         body: SwirlingBoxAnimation(),
//       ),
//     );
//   }
// }









// void main() {
//   runApp(MyApp());
// }

// class SwirlingBoxAnimation extends StatefulWidget {
//   @override
//   _SwirlingBoxAnimationState createState() => _SwirlingBoxAnimationState();
// }

// class _SwirlingBoxAnimationState extends State<SwirlingBoxAnimation>
//     with SingleTickerProviderStateMixin {
//  late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 200,
//         height: 200,
//         child: CustomPaint(
//           painter: SwirlingPainter(
//             animation: _controller,
//             strokeWidth: 4.0,
//             swirlColor: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SwirlingPainter extends CustomPainter {
//   final Animation<double> animation;
//   final double strokeWidth;
//   final Color swirlColor;

//   SwirlingPainter({
//    required this.animation,
//    required this.strokeWidth,
//   required  this.swirlColor,
//   }) : super(repaint: animation);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double halfWidth = size.width / 2;
//     final double halfHeight = size.height / 2;
//     final double radius = halfWidth - strokeWidth / 2;
//     final double angle = animation.value * 2 * math.pi;

//     Paint paint = Paint()
//       ..color = swirlColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

//     canvas.save();
//     canvas.translate(halfWidth, halfHeight);
//     canvas.rotate(angle);

//     // Path path = Path()
//     //   ..moveTo(-radius, -radius)
//     //   ..lineTo(radius, -radius)
//     //   ..lineTo(radius, radius)
//     //   ..lineTo(-radius, radius)
//     //   ..close();
//     Path path = Path()
//       ..moveTo(0, 10)
//       ..lineTo(10, -20)
//       ..lineTo(-20, 40)
//       ..lineTo(-40, 50)
//       ..close();

//     canvas.drawPath(path, paint);
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Swirling Box Animation'),
//         ),
//         body: SwirlingBoxAnimation(),
//       ),
//     );
//   }
// }







void main() {
  runApp(MyApp());
}

class StarPainter extends CustomPainter {
  final double sides;
  final double size;
  final Paint paint1;

  StarPainter({required this.sides, required this.size, required this.paint1});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double radius = size.width > size.height ? size.height / 2 : size.width / 2;
    final double angleIncrement = (math.pi * 2) / sides;
    final double halfAngleIncrement = angleIncrement / 2;

    final Path path = Path();

    double currentAngle = -math.pi / 2;

    for (int i = 0; i < sides; i++) {
      final double x = centerX + radius * math.cos(currentAngle);
      final double y = centerY + radius * math.sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      currentAngle += angleIncrement;
      final double innerX = centerX + (radius / 2) * math.cos(currentAngle + halfAngleIncrement);
      final double innerY = centerY + (radius / 2) * math.sin(currentAngle + halfAngleIncrement);

      path.lineTo(innerX, innerY);
    }

    path.close();

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StarShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: CustomPaint(
          painter: StarPainter(
            sides: 5, // Change the number of sides to create different shapes (e.g., 3 for a triangle)
            size: 100, // Adjust the size of the shape
            paint1: Paint()
              ..color = Colors.blue // Change the color of the shape as desired
              ..style = PaintingStyle.fill,
              
          ),
         
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shape with Path'),
        ),
        body: StarShape(),
      ),
    );
  }
}
