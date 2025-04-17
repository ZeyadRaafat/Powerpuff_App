import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(
      {super.key,
      this.home = false,
      this.course = false,
      this.profile = false});
  final bool home;
  final bool course;
  final bool profile;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            icon: Icons.home,
            label: "Home",
            isSelected: home,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.menu_book,
            label: "My courses",
            isSelected: course,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.person,
            label: "Profile",
            isSelected: profile,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color:
                  isSelected ? Theme.of(context).primaryColor : Colors.blueGrey,
              size: 24),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color:
                  isSelected ? Theme.of(context).primaryColor : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
