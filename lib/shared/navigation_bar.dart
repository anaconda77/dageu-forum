
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavigationBar({super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ]
      ),
      child: SafeArea(
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home, '홈'),
                _buildNavItem(1, Icons.newspaper, '소개'),
                _buildNavItem(2, Icons.search, '회원검색'),
                _buildNavItem(3, Icons.comment, '커뮤니티'),
              ],
            ),
          )),
    );
  }


  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: Colors.blue.withOpacity(0.1), // 터치 효과 색상
        highlightColor: Colors.blue.withOpacity(0.05), // 눌렀을 때의 색상
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.indigoAccent : Colors.grey,
                size: 20,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.indigoAccent : Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}