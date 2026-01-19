import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_controller.dart';
import 'translations.dart';
import 'signup.dart';
import 'drawer_page.dart';

void main() {
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      title: 'Google Drive Clone',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const GoogleSignUpPage()),
        GetPage(name: '/menu', page: () => const Menu()),
      ],
    );
  }
}

class Menu extends GetView<AppController> {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        automaticallyImplyActions: false,
        actions: [
          Builder(builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white70),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          )),
        ],
        title: Container(
          height: 45,
          decoration: BoxDecoration(color: const Color(0xFF2D2D2D), borderRadius: BorderRadius.circular(30)),
          child: TextField(
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "search".tr,
              hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: controller.pickImage,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(() => CircleAvatar(
              radius: 18,
              backgroundColor: Colors.teal,
              backgroundImage: controller.imagePath.value.isNotEmpty ? FileImage(File(controller.imagePath.value)) : null,
              child: controller.imagePath.value.isEmpty ? const Text("G", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
            )),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1C1C1C),
        selectedItemColor: const Color(0xFFD7C1FB),
        unselectedItemColor: Colors.white70,
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.folder_outlined), label: 'files'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.star_outline), label: 'starred'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.people_outline), label: 'shared'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addStudent,
        backgroundColor: const Color(0xFF823229),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      endDrawer: const MyDrawer(),
      body: Column(
        children: [
          Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.volume_down),
                Expanded(child: Slider(value: controller.currentVolume.value, onChanged: (v) => controller.currentVolume.value = v)),
                const Icon(Icons.volume_up),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: "input_hint".tr,
                fillColor: Colors.amber[100],
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.students.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(5),
                color: const Color(0xFF823229),
                child: ListTile(
                  leading: IconButton(icon: const Icon(Icons.delete, color: Colors.white), onPressed: () => controller.removeStudent(index)),
                  title: Text(controller.students[index], textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
                  trailing: IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => controller.editStudent(index)),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}