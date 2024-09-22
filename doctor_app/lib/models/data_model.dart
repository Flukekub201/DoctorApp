class FavoriteMenuItem {
  String favoriteName;
  String image;
  FavoriteMenuItem({required this.favoriteName, required this.image});
}

List<FavoriteMenuItem> data = [
  FavoriteMenuItem(favoriteName: 'Check-in', image: 'assets/img/60.png'),
  FavoriteMenuItem(favoriteName: 'ประวัติการรักษา', image: 'assets/img/60.png'),
  FavoriteMenuItem(favoriteName: 'ประวัติการใช้ยา', image: 'assets/img/60.png'),
  FavoriteMenuItem(favoriteName: 'ตารางนัดหมาย', image: 'assets/img/60.png'),
];

class MenuItemData {
  final String title;
  final String image;

  MenuItemData({required this.title, required this.image});
}

List<MenuItemData> menuItems = [
  MenuItemData(title: 'การรับบริการ', image: 'assets/img/60.png'),
  MenuItemData(title: 'ค่าใช้จ่าย', image: 'assets/img/60.png'),
  MenuItemData(title: 'บันทึกสุขภาพประชาชน', image: 'assets/img/60.png'),
  MenuItemData(title: 'การแพทย์ทางไกล', image: 'assets/img/60.png'),
  MenuItemData(title: 'นำทาง', image: 'assets/img/60.png'),
  MenuItemData(title: 'โทรเรียกรถฉุกเฉิน', image: 'assets/img/60.png'),
  MenuItemData(title: 'หมอพร้อม', image: 'assets/img/60.png'),
];

class Appointment {
  String title;
  String room;
  String time;
  String period;
  String doctor;
  String examType;
  String note;
  String date;

  Appointment({
    required this.title,
    required this.room,
    required this.time,
    required this.period,
    required this.doctor,
    required this.examType,
    required this.note,
    required this.date,
  });
}

List<Appointment> appointments = [
  Appointment(
      title: 'คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้',
      room: 'ห้องตรวจอายุรกรรม',
      time: '09.00 น. -12.00 น.',
      period: 'ตอนนี้',
      doctor: 'นพ. สมชาย ใจดี',
      examType: 'ตรวจโรคทั่วไป',
      note: 'ไม่มี',
      date: '04/05/2024'),
  Appointment(
      title: 'คุณมีนัดหมายการพบแพทย์ในอีก 7 วัน',
      room: 'ห้องตรวจอายุรกรรม',
      time: '09.00 น. -12.00 น.',
      period: '1 สัปดาห์ที่แล้ว',
      doctor: 'นพ. สุดยอด เฮงดี',
      examType: 'ตรวจสุขภาพประจำปี',
      note: 'กรุณานำเอกสารประวัติการรักษามาด้วย',
      date: '28/04/2024'),
];
