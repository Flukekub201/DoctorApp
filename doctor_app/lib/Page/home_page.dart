import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showpas = true;

  void toggleVisibility() {
    setState(() {
      showpas = !showpas;
    });
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
                              TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(13)
                                ],
                                decoration: const InputDecoration(
                                    labelText: 'เลขบัตรประจำตัวประชาชน',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                              ),
                              const SizedBox(height: 30),
                              TextField(
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
                                      color: Colors.grey, // Icon color
                                    ),
                                    onPressed:
                                        toggleVisibility, // Toggles visibility
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: BouncingScrollSimulation
                                      .maxSpringTransferVelocity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)),
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
            )
          ],
        ),
      ),
    );
  }
}
