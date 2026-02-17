import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_construction/screens/Blueprint.dart';
import 'package:flutter_construction/models/customInput.dart';
import 'package:http/http.dart' as http;
// only if you keep it in another file

enum Shape { square, triangle, circle, rectangle, other }

class UserRequirements extends StatefulWidget {
  const UserRequirements({super.key});

  @override
  State<UserRequirements> createState() => _UserRequirementsState();
}

class _UserRequirementsState extends State<UserRequirements> {
  Shape _selectedShape = Shape.square;

  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController bathroomController = TextEditingController();
  final TextEditingController kitchenController = TextEditingController();
  final TextEditingController balconyController = TextEditingController();

// Future<String> sendMessages() async {
//   final length = lengthController.text.trim();
//   final width = widthController.text.trim();
//   final rooms = roomController.text.trim();
//   final bathrooms = bathroomController.text.trim();
//   final kitchens = kitchenController.text.trim();
//   final balconies = balconyController.text.trim();

//   if (length.isEmpty || width.isEmpty) {
//     return "Please enter length and width.";
//   }

//   final response = await http.post(
//     Uri.parse("https://house-blueprint-ai.vercel.app/api/gemini"),
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "prompt":
//           "Generate a house blueprint based on the following details:"
//           "\nLength: $length meters"
//           "\nWidth: $width meters"
//           "\nShape: ${_selectedShape.name}"
//           "\nRooms: $rooms"
//           "\nBathrooms: $bathrooms"
//           "\nKitchens: $kitchens"
//           "\nBalconies: $balconies"
//           "\nGive the best layout."
//     }),
//   );

//   if (response.statusCode == 200) {
//     return jsonDecode(response.body)['output'] ?? "No output received.";
//   } else {
//     return "Error from server: ${response.body}";
//   }
// }

Future<String> sendMessages() async {
  final length = lengthController.text.trim();
  final width = widthController.text.trim();
  final rooms = roomController.text.trim();
  final bathrooms = bathroomController.text.trim();
  final kitchens = kitchenController.text.trim();
  final balconies = balconyController.text.trim();

  if (length.isEmpty || width.isEmpty) {
    return "Please enter length and width.";
  }

  try {
    final response = await http.post(
      Uri.parse("https://AiBlueprintGenerator.vercel.app/api/gemini"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "prompt": """
Generate a detailed house blueprint layout based on:

Length: $length meters
Width: $width meters
Shape: ${_selectedShape.name}
Rooms: $rooms
Bathrooms: $bathrooms
Kitchens: $kitchens
Balconies: $balconies

Provide structured layout explanation.
"""
      }),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final text = data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];

      return text ?? "No blueprint generated.";
    } else {
      return "Server Error: ${response.statusCode}\n${response.body}";
    }
  } catch (e) {
    return "Error occurred: $e";
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 27, 76),
        title: const Center(
          child: Text(
            'Property Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        // color: const Color.fromARGB(255, 12, 89, 153),
        padding: const EdgeInsets.all(20),
        // child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomInputField(
                    labelText: "Plot Length (m)",
                    hintText: "Enter length",
                    controller: lengthController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomInputField(
                    labelText: "Plot Width (m)",
                    hintText: "Enter width",
                    controller: widthController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Field Shape",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 21, 27, 76),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    DropdownButton<Shape>(
                      dropdownColor: Color(Colors.blue[100]!.value),

                      // isse drop down ka color change hota hai
                      value: _selectedShape,
                      items: Shape.values.map((shape) {
                        return DropdownMenuItem<Shape>(
                          value: shape,
                          child: Text(shape.name.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedShape = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomInputField(
                        labelText: "Rooms",
                        hintText: "rooms",
                        controller: roomController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomInputField(
                        labelText: "Bathrooms",
                        hintText: "bathrooms",
                        controller: bathroomController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomInputField(
                        labelText: "Kitchens",
                        hintText: "kitchens",
                        controller: kitchenController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomInputField(
                        labelText: "Balconies",
                        hintText: "balconies",
                        controller: balconyController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
  onPressed: () async {
    final blueprintText = await sendMessages();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Blueprint(
          blueprintData: blueprintText,
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo[900],
  ),
  child: const Text(
    'Generate Blueprint',
    style: TextStyle(color: Colors.white),
  ),
)

                ),
              ],
            ),
          ],
        ),
      ),
    );
    // );
  }
}
