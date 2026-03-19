import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_construction/models/blueprint_painter.dart';

class Blueprint extends StatelessWidget {
  final String blueprintData;

  const Blueprint({super.key, required this.blueprintData});

  @override
  Widget build(BuildContext context) {
    List rooms = [];

try {
  final decoded = jsonDecode(blueprintData);
  rooms = decoded["rooms"] ?? [];
} catch (e) {
  print("Invalid JSON from API");
}
    return Scaffold(
      appBar: AppBar(title: Text("Generated Blueprint")),
      body: Center(
        child: CustomPaint(
          size: Size(400, 400),
          painter: BlueprintPainter(rooms),
        ),
      ),
    );
  }
}