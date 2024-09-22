import 'package:doctor_app/Page/home_page.dart';
import 'package:doctor_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import 'appointment_page.dart';

class MainPage extends StatefulWidget {
  final int selectedIndex;

  const MainPage({super.key, this.selectedIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;

  final List<Widget> _pages = [
    const HomPage(),
    const Center(
      child: Text('ประชาสัมพันธ์'),
    ),
    const AppointmentPage(),
    const Center(
      child: Text('ข้อมูลของฉัน'),
    ),
    const Center(
      child: Text('ตั้งค่า'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigationBer(
        selectedIndex: _selectedIndex,
        onTabSelected: _onItemTapped,
      ),
    );
  }
}
