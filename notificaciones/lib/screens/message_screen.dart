import 'package:flutter/material.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('MessageScreen', style: TextStyle(fontSize: 30),)
      ),
    );
  }
}