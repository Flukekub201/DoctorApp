import 'dart:ui';

import 'package:doctor_app/Page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idcardcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showpas = true;

  void toggleVisibility() {
    setState(() {
      showpas = !showpas;
    });
  }

  void _sumitForm() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'เข้าสู่ระบบ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: BouncingScrollSimulation.maxSpringTransferVelocity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background/background.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 300),
              height: 500,
              width: BouncingScrollSimulation.maxSpringTransferVelocity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Text(
                            'ยินดีตอนรับ',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: idcardcontroller,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(13)
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'เลขบัตรประจำตัวประชาชน',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณากรอกเลขประจำตัวประชาชน';
                                    } else if (value.length != 13) {
                                      return 'กรุณากรอกเลขเลขประจำตัวประชาชนให้ครบ 13 หลัก';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: showpas,
                                  decoration: InputDecoration(
                                    labelText: 'รหัสผ่าน',
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showpas
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: toggleVisibility,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณากรอกรหัสผ่าน';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: _sumitForm,
                                  child: Container(
                                    width: BouncingScrollSimulation
                                        .maxSpringTransferVelocity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                        child: Text(
                                      'เข้าสู่ระบบ',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          const Text('หากยังไม่มีบัญชี'),
                                          TextButton(
                                            onPressed: () {
                                              print('ลงทะเบียน');
                                            },
                                            child: const Text(
                                              'ลงทะเบียน',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          print('ลืมรห้สผ่าน?');
                                        },
                                        child: const Text(
                                          'ลืมรห้สผ่าน?',
                                          style: TextStyle(color: Colors.blue),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
