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
