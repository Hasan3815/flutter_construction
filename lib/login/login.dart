import 'package:flutter/material.dart';
import 'package:flutter_construction/login/create_account.dart';
import 'package:flutter_construction/login/forget_password.dart';
import 'package:flutter_construction/screens/project_type.dart';

class FirstSlide extends StatefulWidget {
  final String userName;

  final void Function()? Login;

  const FirstSlide({super.key, this.Login, required this.userName});

  @override
  State<FirstSlide> createState() => _FirstSlideState();
}

class _FirstSlideState extends State<FirstSlide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: Card(
            child: Container(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 16, 30, 110),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Email or Phone',
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 275,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectType(),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                      ),

                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ForgetPassword())
                        );
                      });

                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 124, 133, 231),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccount(),
                          ),
                        );
                      });
                      
                    },
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 124, 133, 231),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
