

import 'package:flutter/material.dart';

class Blueprint extends StatelessWidget {
  final String blueprintData; 

  const Blueprint({super.key, required this.blueprintData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19), 
      appBar: AppBar(
        title: const Text("Generated Blueprint"),
        backgroundColor: const Color.fromARGB(255, 164, 167, 192),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SelectableText(
            blueprintData,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black, 
            ),
          ),
        ),
      ),
    );
  }
}
