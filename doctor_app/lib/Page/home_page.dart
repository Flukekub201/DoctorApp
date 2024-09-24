import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/data_model.dart';
import 'main_page.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  bool _isVisibleFavoriteList = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBody(),
        AnimatedSlide(
          offset: _isVisibleFavoriteList ? Offset(0, 0) : Offset(0, -0.1),
          duration: Duration(milliseconds: 300),
          child: _isVisibleFavoriteList ? _FavoriteList() : SizedBox.shrink(),
        ),
        const SizedBox(
          height: 10,
        ),
        _buttonHide(),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: MainMenu()),
      ],
    );
  }

  Widget _TopBody() {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0.0, -3.0),
                )
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(selectedIndex: 2),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/img/80.png',
                            height: 80, width: 80, fit: BoxFit.cover),
                        const SizedBox(height: 10),
                        const Text(
                          'นัดหมายล่วงหน้า',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: 10, right: 2, left: 10, bottom: 2),
              height: 150,
              color: const Color.fromARGB(255, 165, 243, 167),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.green),
                      SizedBox(width: 5),
                      Text(
                        'ตารางนัดหมายที่กำลังมาถึง',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 3, 165, 24)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('16 มกราคม 2566',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Text(', 10:30',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('แผนกรังสีคลินิกพิเศษ',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('นพ.ยุทธภพ ใต้หลามหาสมุทร',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('ดูตารางนัดหมายของฉัน',
                          style: TextStyle(color: Colors.grey)),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _FavoriteList() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'รายการโปรด',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'แก้ไข',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length + 1,
              itemBuilder: (context, index) {
                if (index == data.length) {
                  return Container(
                    width: 100,
                    child: Center(
                      child: ClipOval(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.black26,
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(data[index].image,
                                  height: 60, width: 60, fit: BoxFit.cover),
                              const SizedBox(height: 5),
                              Text(
                                data[index].favoriteName,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonHide() {
    return InkWell(
      onTap: () {
        setState(() {
          _isVisibleFavoriteList = !_isVisibleFavoriteList;
        });
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black26,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            _isVisibleFavoriteList ? "ซ่อนเมนูทั้งหมด" : "แสดงเมนูโปรดอีกครั้ง",
            style: const TextStyle(
                color: Colors.black38, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Widget MainMenu() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10),
    itemCount: menuItems.length,
    itemBuilder: (context, index) {
      return Container(
        padding: const EdgeInsets.all(5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(menuItems[index].image,
                  height: 60, width: 60, fit: BoxFit.cover),
              const SizedBox(
                height: 5,
              ),
              Text(
                menuItems[index].title,
                style: menuItems[index].title == 'โทรเรียกรถฉุกเฉิน' ||
                        menuItems[index].title == 'การแพทย์ทางไกล' ||
                        menuItems[index].title == 'บันทึกสุขภาพประชาชน'
                    ? const TextStyle(fontSize: 8, fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    },
  );
}
