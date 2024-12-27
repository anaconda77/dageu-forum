import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '미래지식포럼',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeMainScreen(),
    );
  }
}

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              print('로고 클릭');
            }, 
            icon: const Icon(Icons.school),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu), // 오른쪽 상단 메뉴
            onPressed: () {
              print('개인정보 클릭');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 배너 섹션 (배경 색상으로 대체)
            Container(
              height: 200,
              color: Colors.blue[200], // 배경 색상
              child: Padding(
                padding: const EdgeInsets.all(16.0), // 좌측으로 여백 추가
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                  children: const [
                    Text(
                      '대구가톨릭대학교',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      '미래지식포럼',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 6개 버튼 섹션
            Transform.translate(
              offset: const Offset(0,-50),
              child: SizedBox(
                height: 240,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.blue[900],
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return InkWell(
                          onTap: item.onTap,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item.icon, size: 36, color: Colors.white),
                              const SizedBox(height: 8),
                              Text(
                                item.label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),


            // 공지사항 박스
            Transform.translate(
              offset: const Offset(0, -35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  //margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '최신 공지사항',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                print('공지사항 클릭');
                              },
                              icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            ),
                          ],
                        ),

                        //공지사항 공간(빈상태)
                        Column(
                          children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '공지사항이 없습니다.', // 임시 텍스트
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 메뉴 아이템 데이터 모델
class MenuItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  MenuItem({required this.label, required this.icon, required this.onTap});
}

// 메뉴 아이템 리스트
final List<MenuItem> menuItems = [
  MenuItem(label: '회장인사말', icon: Icons.person, onTap: () {}),
  MenuItem(label: '원장인사말', icon: Icons.person_outline, onTap: () {}),
  MenuItem(label: '조직도', icon: Icons.account_tree, onTap: () {}),
  MenuItem(label: '회칙', icon: Icons.edit, onTap: () {}),
  MenuItem(label: '모집요강', icon: Icons.article, onTap: () {}),
  MenuItem(label: '공지사항', icon: Icons.notifications, onTap: () {}),
];


