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

  if (decoded is Map && decoded["rooms"] is List) {
    rooms = decoded["rooms"];
  } else {
    rooms = [];
  }
} catch (e) {
  debugPrint("Invalid JSON from API: $e");
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