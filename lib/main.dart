import 'package:flutter/material.dart';
import 'buttons/raised_button.dart';
import 'buttons/flat_button.dart';
import 'buttons/icon_button.dart';
import 'buttons/floating_action_button.dart';
import 'buttons/cupertino_button.dart';
import 'buttons/custom_gesture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _showText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App - Anugrah Putra Al Fatih')),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, size: 50, color: Colors.amber),
                Icon(Icons.favorite, size: 50, color: Colors.red),
                Icon(Icons.home, size: 50, color: Colors.green),
                Icon(Icons.phone, size: 50, color: Colors.blue),
                Icon(Icons.school, size: 50, color: Colors.purple),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to My App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black54,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/nuga.jpg',
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 200,
                  color: Colors.white,
                );
              },
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWbVCcxpGBIbmUegXeAHrzxuWJFTRbT31YjQ&s',
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 200,
                  color: Colors.white,
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _showText,
                    child: const Text('Show Text'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _displayText,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  // Tambahkan teks "Flutter Buttons Demo" di sini
                  const Text(
                    'Flutter Buttons Demo',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black54,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildNavigationButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      children: [
        _buildNavigationButton(context, 'Raised Button', RaisedButtonDemo()),
        _buildNavigationButton(context, 'Flat Button', FlatButtonDemo()),
        _buildNavigationButton(context, 'Icon Button', IconButtonDemo()),
        _buildNavigationButton(
          context,
          'Floating Action Button',
          FloatingActionButtonDemo(),
        ),
        _buildNavigationButton(
          context,
          'Cupertino Button',
          CupertinoButtonScreen(),
        ),
        _buildNavigationButton(
          context,
          'Custom Gesture',
          CustomGestureScreen(),
        ),
      ],
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String title,
    Widget screen,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        width: double.infinity, // Membuat tombol selebar mungkin
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          child: Text(title),
        ),
      ),
    );
  }
}
