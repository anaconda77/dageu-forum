import 'package:daeguforum/conda/shared/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:daeguforum/feature/NewsPage.dart';
import 'package:daeguforum/feature/SearchPage.dart';
import 'package:daeguforum/feature/CommunityPage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeMainScreen(),
    const NewsPage(),
    const SearchPage(),
    const CommunityPage(),
  ];

  void _onNavBarTap(int index){
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu), // 오른쪽 상단 메뉴
            onPressed: () {
              print('개인정보 클릭');
            },
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      // backgroundColor: Colors.grey[50],
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
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex ,
        onTap: _onNavBarTap,
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
  MenuItem(
    label: '회장인사말',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const NewsPage()),
      );
    },
  ),
  MenuItem(
    label: '원장인사말',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const NewsPage()),
      );
    },
  ),MenuItem(
    label: '조직도',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const NewsPage()),
      );
    },
  ),MenuItem(
    label: '회칙',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const NewsPage()),
      );
    },
  ),MenuItem(
    label: '모집요강',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const NewsPage()),
      );
    },
  ),MenuItem(
    label: '공지사항',
    icon: Icons.person,
    onTap: () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const CommunityPage()),
      );
    },
  ),
];

