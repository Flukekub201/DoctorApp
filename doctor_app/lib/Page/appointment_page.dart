import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/data_model.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: const Text(
            'ล่าสุด',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(appointment);
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 130,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/img/80.png'),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment.title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      appointment.room,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    const Text(
                                      'เวลา',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      appointment.time,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              appointment.period,
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget popup(Appointment appointment) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
          child: Column(
        children: [
          const Text(
            'รายละเอียดนัดหมาย',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 250,
            height: 2,
            color: Colors.grey,
          ),
        ],
      )),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('ประเภทการตรวจ: '),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('แพทย์: '),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('ห้องตรวจ: '),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('เวลานัดหมาย: '),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('วันที่นัดหมาย: '),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(appointment.examType),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(appointment.doctor),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(appointment.room),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(appointment.time),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(appointment.date),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 2)),
              child: Center(child: const Text('ปิด')),
            ),
          ),
        ),
      ],
    );
  }
}
