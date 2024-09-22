class FavoriteMenuItem {
  String favoriteName;
  FavoriteMenuItem({required this.favoriteName});
}

class MenuItemData {
  final String title;

  MenuItemData({required this.title});
}

List<FavoriteMenuItem> data = [
  FavoriteMenuItem(favoriteName: 'Check-in'),
  FavoriteMenuItem(favoriteName: 'ประวัติการรักษา'),
  FavoriteMenuItem(favoriteName: 'ประวัติการใช้ยา'),
  FavoriteMenuItem(favoriteName: 'ตารางนัดหมาย'),
];
List<MenuItemData> menuItems = [
  MenuItemData(title: 'การรับบริการ'),
  MenuItemData(title: 'ค่าใช้จ่าย'),
  MenuItemData(title: 'บันทึกสุขภาพประชาชน'),
  MenuItemData(title: 'การแพทย์ทางไกล'),
  MenuItemData(title: 'นำทาง'),
  MenuItemData(title: 'โทรเรียกรถฉุกเฉิน'),
  MenuItemData(title: 'หมอพร้อม'),
];
