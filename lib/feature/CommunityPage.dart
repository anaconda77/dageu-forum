import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _selectedIndex = 0; // 현재 선택된 탭의 인덱스
  final TextEditingController _searchController = TextEditingController(); // 검색어 입력 관리
  String _searchType = '제목'; // 검색 타입 (제목/작성자) 관리
// 각 탭에 해당하는 컨텐츠 위젯의 리스트
  final List<Widget> _pages = [
    const NoticesContent(),
    const FreeBoardContent(),
    const FreeAlbumContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 현재 선택된 탭을 추적
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 상단바 - 타이틀, 뒤로가기 버튼
      appBar: AppBar(
        title: const Text('상단바 (로고)'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // 2. 상단 영역
      body: Column(
        children: [
          // 2-1. 상단 네비게이션 버튼
          TopNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          // 2-2. 검색 영역 - 검색 타입 드롭다운 + 검색어 입력 텍스트 필드 + 검색 실행 버튼
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(4.0),
                    ),
                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  // 2-2-1. 검색 타입 선택 드롭다운
                  child: PopupMenuButton<String>(
                    initialValue: _searchType,
                    onSelected: (String value) {
                      setState(() {
                        _searchType = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: '제목',
                        child: Text('제목'),
                      ),
                      const PopupMenuItem(
                        value: '작성자',
                        child: Text('작성자'),
                      ),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            _searchType,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(4.0),
                      ),
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300),
                        right: BorderSide(color: Colors.grey.shade300),
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        // 2-2-2. 검색어 입력 필드
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: '검색어를 입력해주세요',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 8.0,
                              ),
                            ),
                          ),
                        ),
                        // 2-2-3. 검색 버튼
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.grey),
                          onPressed: () {
                            print('검색: ${_searchController.text} (${_searchType})');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 3. 컨텐츠 영역 - 선택된 탭 내용 표시
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

// 2-1. 상단 네비게이션바 - '공지사항', '자유게시판', '자유앨범'
class TopNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavButton(context, '공지사항', 0),
          _buildNavButton(context, '자유게시판', 1),
          _buildNavButton(context, '자유앨범', 2),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
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

// 3. 상단 네비게이션바 누르면 이동하는 위젯

// 3-1. 공지사항 -> 게시물 형태 표시하는 리스트
class NoticesContent extends StatelessWidget {
  const NoticesContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 게시물 데이터
    final List<Map<String, dynamic>> noticeItems = [
      {
        'title': '대구 가톨릭 대학교 미래지식포럼 제 14회 총동창회장배 본교총장배 한마당 골프대회',
        'author': '관리자',
        'date': '2024/10/28',
        'time': '18:14',
        'views': 59,
        'comments': 0,
      },
      // 데이터 추가
    ];

    return Container(
      color: Colors.white, // 전체 배경은 흰색으로
      // ListView.builder를 사용하여 게시물 목록 생성 -> 스크롤 가능한 리스트
      child: ListView.builder(
        itemCount: noticeItems.length, // 전체 게시물 수 지정
        itemBuilder: (context, index) { // 각 게시물 구성 함수
          final item = noticeItems[index];
        // 개별 게시물 구조
          return Container( // 각 게시물을 감싸는 컨테이너
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide( // 하단에 구분선
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 3-1-1. 게시물 제목
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2, // 최대 2줄까지만 표시
                    overflow: TextOverflow.ellipsis, // 넘치는 텍스트는 ...으로 표시
                  ),
                  const SizedBox(height: 8),
                  // 3-1-2. 게시물 정보 (작성자, 날짜, 시간, 조회수, 댓글수)
                  Row( // 가로 배치
                    children: [
                      // 작성자
                      Text(
                        item['author'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 날짜, 시간
                      Text(
                        '${item['date']} ${item['time']}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(), // 중간 공간 채움
                      // 조회수
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${item['views']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // 댓글수
                      Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${item['comments']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// 3-2. 자유게시판
class FreeBoardContent extends StatelessWidget {
  const FreeBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('자유게시판 내용'),
      ),
    );
  }
}
// 3-3. 자유앨범
class FreeAlbumContent extends StatelessWidget {
  const FreeAlbumContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('자유앨범 내용'),
      ),
    );
  }
}