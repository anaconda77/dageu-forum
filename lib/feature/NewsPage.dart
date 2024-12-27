import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0; // 현재 선택된 탭의 인덱스

  // 각 탭에 대응하는 컨텐츠 위젯의 리스트
  final List<Widget> _pages = [
    const PresidentMessageContent(),
    const DirectorMessageContent(),
    const OrganizationContent(),
    const YearlyPlanContent(),
    const RegulationsContent(),
    const RecruitmentContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 상단바
      appBar: AppBar(
        title: const Text('상단바(로고)'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 2. 상단 탭 버튼들
          TopNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          Expanded(
            // 3. 선택된 탭의 컨텐츠
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
// 2. 상단 네비게이션 버튼
class TopNavigationBar extends StatelessWidget {
  final int selectedIndex; // 현재 선택된 탭 인덱스
  final Function(int) onItemTapped; // 탭 선택 시 호출될 함수

  const TopNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
      child: SingleChildScrollView( // 상단 탭 바 가로 스크롤 가능
        scrollDirection: Axis.horizontal,
        child: Row(
          // 상단 네비게이션바 버튼 누르면 페이지 이동
          children: [
            _buildNavButton(context, '회장인사말', 0),
            _buildNavButton(context, '원장인사말', 1),
            _buildNavButton(context, '조직도', 2),
            _buildNavButton(context, '연중사업', 3),
            _buildNavButton(context, '회칙', 4),
            _buildNavButton(context, '모집요강', 5),
          ],
        ),
      ),
    );
  }
 // 버튼 생성
  Widget _buildNavButton(BuildContext context, String title, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          // 선택된 탭은 파란색 밑줄, 파란색 글자
          // 아닌 탭은 검정색 글자, 투명한 밑줄 (밑줉 X)
          bottom: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      // 상단 네비게이션바 버튼 선택되면 글자색 파란색, 밑줄 파란색으로 변경
      child: TextButton(
        onPressed: () => onItemTapped(index),
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.blue : Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 3. 컨텐츠 페이지 6개
// 3-1. 회장 인사말
class PresidentMessageContent extends StatelessWidget {
  const PresidentMessageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('회장인사말 내용'),
      ),
    );
  }
}

// 3-2. 원장 인사말
class DirectorMessageContent extends StatelessWidget {
  const DirectorMessageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('원장인사말 내용'),
      ),
    );
  }
}

// 3-3. 조직도
class OrganizationContent extends StatelessWidget {
  const OrganizationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('조직도 내용'),
      ),
    );
  }
}

// 3-4. 연중 사업
class YearlyPlanContent extends StatelessWidget {
  const YearlyPlanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('연중사업 내용'),
      ),
    );
  }
}

// 3-5. 회책
class RegulationsContent extends StatelessWidget {
  const RegulationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('회칙 내용'),
      ),
    );
  }
}

// 3-6. 모집 요강
class RecruitmentContent extends StatelessWidget {
  const RecruitmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('모집요강 내용'),
      ),
    );
  }
}