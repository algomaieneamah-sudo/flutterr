import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_controller.dart';

class MyDrawer extends GetView<AppController> {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      width: 300,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0))),
      child: Directionality(
        textDirection: Get.locale?.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                child: const Text("Google Drive", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            _buildListTile(Icons.access_time, "events".tr),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.white),
              title: Text("add_acc".tr, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              onTap: () => Get.toNamed('/'),
            ),
            _buildListTile(Icons.offline_pin_outlined, "downloads".tr),
            _buildListTile(Icons.delete_outline, "trash".tr),
            _buildListTile(Icons.info_outline, "spam".tr),
            _buildListTile(Icons.settings_outlined, "settings".tr),
            _buildListTile(Icons.help_outline_rounded, "help".tr),
            _buildListTile(Icons.cloud_outlined, "storage".tr),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(value: 0.11, backgroundColor: Colors.white12, color: Colors.blue, minHeight: 4),
                  ),
                  const SizedBox(height: 8),
                  Text("storage_info".tr, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: Text("get_more".tr, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  // زر تغيير اللغة مضاف للسهولة
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.white),
                    title: const Text("Language", style: TextStyle(color: Colors.white)),
                    onTap: controller.toggleLanguage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      onTap: () {},
    );
  }
}