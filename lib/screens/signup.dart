import 'package:flutter/material.dart';
import 'package:unimate/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final enrollmentController = TextEditingController();
  var instituteValue;
  var departmentValue;
  var institutes = [];
  var department = [];

  void _submitform(){
    if(_formKey.currentState!.validate()){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const Homepage()));
    }
  }
  Future<void> getInstitutes() async {
    final response = await _firestore.collection('institute').get();
    institutes = response.docs.map((e) => e.data()).toList();
    // print(institutes);
    if (institutes.isNotEmpty) {}
    return;
  }

  Future<void> getDepartment() async {
    final instituteSelected = institutes
        .where((element) => element['name'] == instituteValue)
        .toList();
    final id = instituteSelected[0]['id'];
    final response = await _firestore
        .collection('institute')
        .doc(id)
        .collection('department')
        .get();
    department = response.docs.map((e) => e.data()).toList();
    return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInstitutes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Scaffold(
                body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(138, 94, 65, 1)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 341,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(163, 136, 119, 1),
                                ),
                                filled: true,
                                fillColor: const Color.fromRGBO(254, 253, 253, 1),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                              ),
                              cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                              textAlign: TextAlign.center,
                              controller: nameController,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Color.fromRGBO(163, 136, 119, 1)),
                              validator: (name) => name!.isEmpty ? "Full Name is Required." : null,
                            ),
                            const SizedBox(height: 38),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Contact",
                                hintStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(163, 136, 119, 1)),
                                filled: true,
                                fillColor: const Color.fromRGBO(254, 253, 253, 1),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                              ),
                              cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                              textAlign: TextAlign.center,
                              controller: contactController,
                              validator: (number) {
                                if(number!.isEmpty){
                                  return "Contact is Required.";
                                }
                                else if(number.length<10 || number.length>10){
                                  return "Enter Valid Contact.";
                                }
                                else{
                                  return null;
                                }
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Color.fromRGBO(163, 136, 119, 1)),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 38),
                            DropdownButtonFormField(
                              isExpanded: true,
                              value: instituteValue,
                              decoration: InputDecoration(
                                hintText: '                   Institute',
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(163, 136, 119, 1)),
                                filled: true,
                                fillColor: const Color.fromRGBO(254, 253, 253, 1),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                              ),
                              validator: (inst) => inst==null ? "Select any One." : null,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Color.fromRGBO(163, 136, 119, 1),
                              ),
                              elevation: 16,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Color.fromRGBO(163, 136, 119, 1)),
                              items: institutes
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e['name'],
                                      child: Center(
                                        child: Text(
                                          e['name'],
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Color.fromRGBO(
                                                  163, 136, 119, 1)),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) async {
                                setState(() {
                                  instituteValue = value;
                                  // print(instituteValue);
                                });
                                await getDepartment();
                              },
                            ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     hintText: "College",
                            //     hintStyle: const TextStyle(
                            //         fontSize: 24,
                            //         color: Color.fromRGBO(163, 136, 119, 1)),
                            //     filled: true,
                            //     fillColor: const Color.fromRGBO(254, 253, 253, 1),
                            //     focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(20),
                            //         borderSide: const BorderSide(
                            //             width: 2.0,
                            //             color: Color.fromRGBO(138, 94, 65, 1))),
                            //     enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(20),
                            //         borderSide: const BorderSide(
                            //             width: 2.0,
                            //             color: Color.fromRGBO(138, 94, 65, 1))),
                            //   ),
                            //   cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                            //   textAlign: TextAlign.center,
                            // ),

                            const SizedBox(height: 38),
                            DropdownButtonFormField(
                              isExpanded: true,
                              value: departmentValue,
                              decoration: InputDecoration(
                                hintText: '                  Department',
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(163, 136, 119, 1)),
                                filled: true,
                                fillColor: const Color.fromRGBO(254, 253, 253, 1),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                              ),
                              validator: (dept) => dept==null ? "Select any One." : null,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Color.fromRGBO(163, 136, 119, 1),
                              ),
                              elevation: 16,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Color.fromRGBO(163, 136, 119, 1)),
                              items: department
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e['name'],
                                      child: Center(
                                        child: Text(
                                          e['name'],
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Color.fromRGBO(
                                                  163, 136, 119, 1)),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  departmentValue = value;
                                });
                              },
                            ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     hintText: "Department",
                            //     hintStyle: const TextStyle(
                            //         fontSize: 24,
                            //         color: Color.fromRGBO(163, 136, 119, 1)),
                            //     filled: true,
                            //     fillColor: const Color.fromRGBO(254, 253, 253, 1),
                            //     focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(20),
                            //         borderSide: const BorderSide(
                            //             width: 2.0,
                            //             color: Color.fromRGBO(138, 94, 65, 1))),
                            //     enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(20),
                            //         borderSide: const BorderSide(
                            //             width: 2.0,
                            //             color: Color.fromRGBO(138, 94, 65, 1))),
                            //   ),
                            //   cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                            //   textAlign: TextAlign.center,
                            // ),
                            const SizedBox(height: 38),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enrollment",
                                hintStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(163, 136, 119, 1)),
                                filled: true,
                                fillColor: const Color.fromRGBO(254, 253, 253, 1),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 3.0,
                                        color: Color.fromRGBO(137, 1, 4, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color.fromRGBO(138, 94, 65, 1))),
                              ),
                              validator: (enroll) {
                                if(enroll!.isEmpty){
                                  return "Enrolment is Required.";
                                }
                                else if(enroll.length<10 || enroll.length>10){
                                  return "Enter Valid Enrolment.";
                                }
                                else{
                                  return null;
                                }
                              },
                              cursorColor: const Color.fromRGBO(138, 94, 65, 1),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Color.fromRGBO(163, 136, 119, 1)),
                              controller: enrollmentController,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 170,
                              height: 66,
                              child: ElevatedButton(
                                onPressed: () {
                                  _submitform();
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold),
                                  foregroundColor:
                                      const Color.fromRGBO(254, 253, 253, 1),
                                  backgroundColor:
                                      const Color.fromRGBO(138, 94, 65, 1),
                                ),
                                child: const Text("Continue"),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        }
      },
    );
  }
}
