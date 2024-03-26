import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimate/screens/homepage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(138, 94, 65, 1)
                ),),
              const SizedBox(height: 30,),
              SizedBox(
                width: 341,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(163, 136, 119, 1)
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(254, 253, 253, 1),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                      ),
                      cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 38),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Contact",
                        hintStyle: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(163, 136, 119, 1)
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(254, 253, 253, 1),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                      ),
                      cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 38),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "College",
                        hintStyle: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(163, 136, 119, 1)
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(254, 253, 253, 1),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                      ),
                      cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 38),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Department",
                        hintStyle: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(163, 136, 119, 1)
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(254, 253, 253, 1),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                      ),
                      cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 38),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enrolment",
                        hintStyle: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(163, 136, 119, 1)
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(254, 253, 253, 1),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(138, 94, 65, 1)
                            )),
                      ),
                      cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 170,
                      height: 66,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));
                          },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                          foregroundColor: const Color.fromRGBO(254, 253, 253, 1),
                          backgroundColor: const Color.fromRGBO(138, 94, 65, 1),
                        ),
                          child:const Text("Continue"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
