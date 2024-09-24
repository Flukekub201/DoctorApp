import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomNavigationBer({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0.0, -3.0),
        )
      ]),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(
              icon: Icons.home,
              index: 0,
              selectedIndex: selectedIndex,
            ),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(
              icon: Icons.message,
              index: 1,
              selectedIndex: selectedIndex,
            ),
            label: 'ประชาสัมพันธ์',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                _buildAnimatedIcon(
                  icon: Icons.notifications_active,
                  index: 2,
                  selectedIndex: selectedIndex,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(
              icon: Icons.person,
              index: 3,
              selectedIndex: selectedIndex,
            ),
            label: 'ข้อมูลของฉัน',
          ),
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(
              icon: Icons.settings,
              index: 4,
              selectedIndex: selectedIndex,
            ),
            label: 'ตั้งค่า',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTabSelected,
      ),
    );
  }
}

Widget _buildAnimatedIcon({
  required IconData icon,
  required int index,
  required int selectedIndex,
}) {
  bool isSelected = selectedIndex == index;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    padding:
        EdgeInsets.only(bottom: isSelected ? 0 : 4), // ยกไอคอนขึ้นเมื่อถูกเลือก
    child: Icon(
      icon,
      size: isSelected ? 30 : 24, // ขยายไอคอนเมื่อถูกเลือก
    ),
  );
}
