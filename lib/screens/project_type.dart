import 'package:flutter/material.dart';
import 'package:flutter_construction/screens/select_quality.dart';

class ProjectType extends StatefulWidget {
  const ProjectType({super.key});

  @override
  State<ProjectType> createState() => ProjectTypeState();
}

class ProjectTypeState extends State<ProjectType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.ac_unit_rounded, color: Colors.white),
        ],
        backgroundColor: Color.fromARGB(255, 21, 27, 76),
        title: Row(
          children: [
            Text(
              'Hi,sarah ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Icon(Icons.ac_unit_rounded, color: Colors.white),
          ],
        ),
      ),

      body: Container(
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Center(
            child: Column(
              // child: Text('Select Project Type', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              children: [
                SizedBox(height: 30),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,    // This is IMPORTANT — clips child to the rounded border

                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectQuality(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      color: Color.fromARGB(255, 21, 27, 76),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home, size: 50, color: Colors.white),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New Project",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectQuality(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      color: Color.fromARGB(255, 21, 27, 76),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_copy_sharp,
                                size: 50,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Previous Project",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
