import 'package:Powerpuff/core/services/local_storage_service.dart';
import 'package:Powerpuff/features/view_models/user_viewmodel.dart';
import 'package:Powerpuff/view/widgets/profileoption.dart';
import 'package:flutter/material.dart';
import 'package:Powerpuff/features/view_models/theme_viewmodel.dart';
import 'package:get/get.dart';

class Profilemenu extends StatefulWidget {
  @override
  State<Profilemenu> createState() => _Profilemenu();
}

class _Profilemenu extends State<Profilemenu> {
  final UserViewModel userViewModel = Get.find<UserViewModel>();
  String activeTheme = "";

  void _onThemeChanged(String theme, bool enabled) {
    if (!enabled) return;

    setState(() {
      activeTheme = theme;
    });

    themeViewModel.changeTheme(theme);
  }

  final ThemeViewModel themeViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Your profile",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/zoro.png'),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Obx(() => Text(
                userViewModel.getUserName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Text("Amgooodd@ohyeah.com", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              Divider(),
              ProfileOption(icon: Icons.person_outline, text: "Edit Profile"),
              ProfileOption(
                  icon: Icons.notifications_none, text: "Notification"),
              ProfileOption(icon: Icons.payment, text: "Payment"),
              ProfileOption(
                icon: Icons.language,
                text: "Language",
              ),
              ProfileOption(
                icon: Icons.dark_mode_outlined,
                text: "Blossom Mode",
                showSwitch: true,
                switchValue: activeTheme == "Blossom",
                onChanged: (val) => _onThemeChanged("Blossom", val),
              ),
              ProfileOption(
                icon: Icons.dark_mode_outlined,
                text: "Bubbels Mode",
                showSwitch: true,
                switchValue: activeTheme == "Bubbels",
                onChanged: (val) => _onThemeChanged("Bubbels", val),
              ),
              ProfileOption(
                icon: Icons.dark_mode_outlined,
                text: "Buttercup Mode",
                showSwitch: true,
                switchValue: activeTheme == "Buttercup",
                onChanged: (val) => _onThemeChanged("Buttercup", val),
              ),
              ProfileOption(
                icon: Icons.dark_mode_outlined,
                text: "Mojo Mode",
                showSwitch: true,
                switchValue: activeTheme == "Mojo",
                onChanged: (val) => _onThemeChanged("Mojo", val),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {
                  LocalStorageService.logout();
                },
                icon: Icon(Icons.logout, color: Colors.red),
                label: Text("Logout", style: TextStyle(color: Colors.red)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
