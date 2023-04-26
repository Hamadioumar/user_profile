import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ProfileScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.title});
  final String title;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/pc.jpg'),
        Transform.translate(
          offset: const Offset(0, 100),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Hamadi Oumar',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Follow'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Message'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const StarRating(rating: 5, size: 40, color: Colors.yellow),
                    const SizedBox(height: 10),
                    _buildDetailRow('Name', 'John Doe'),
                    _buildDetailRow('Email', 'abc@mail.com'),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text('photos', style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/logo.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/logo.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/logo.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

Widget _buildDetailRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

class Star extends StatelessWidget {
  final Color color;
  final double size;
  const Star({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: StarPainter(color: color),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;
  StarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.677, size.height * 0.257);
    path.lineTo(size.width * 0.975, size.height * 0.345);
    path.lineTo(size.width * 0.785, size.height * 0.593);
    path.lineTo(size.width * 0.794, size.height * 0.905);
    path.lineTo(size.width * 0.5, size.height * 0.8);
    path.lineTo(size.width * 0.206, size.height * 0.905);
    path.lineTo(size.width * 0.215, size.height * 0.593);
    path.lineTo(size.width * 0.025, size.height * 0.345);
    path.lineTo(size.width * 0.323, size.height * 0.257);
    path.lineTo(size.width * 0.5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StarRating extends StatelessWidget {
  final int rating;
  final double size;
  final Color color;
  const StarRating(
      {super.key,
      required this.rating,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < rating) {
          return Star(color: color, size: size);
        } else {
          return Star(color: Colors.grey, size: size);
        }
      }),
    );
  }
}
