import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // '기수', '직종', '한글명' 필터 - 초기 선택값
  String _periodFilter = '기수';
  String _levelFilter = '직종';
  String _nameFilter = '한글명';
  final TextEditingController _searchController = TextEditingController(); // 검색어 입력 관리
  int totalCount = 2115; // 검색 결과 총 인원수

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 상단바
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                // 2. 검색 영역
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      // 2-1. 기수 필터
                      _buildFilterDropdown(
                        value: _periodFilter,
                        items: ['기수', '1기', '2기', '3기'], // 앱 보고 수정
                        onChanged: (value) {
                          setState(() {
                            _periodFilter = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 12),

                      // 2-2. 직종 필터
                      _buildFilterDropdown(
                        value: _levelFilter,
                        items: ['직종', '회장', '부회장', '이사'], // 앱 보고 수정
                        onChanged: (value) {
                          setState(() {
                            _levelFilter = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 12),

                      // 2-3. 언어 필터
                      _buildFilterDropdown(
                        value: _nameFilter,
                        items: ['한글명', '영문명'],
                        onChanged: (value) {
                          setState(() {
                            _nameFilter = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 12),

                      // 2-4. 검색창
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: '검색어 입력',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            // 오른쪽 끝에 검색 아이콘
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search, color: Colors.grey),
                              onPressed: () {
                                // 검색 기능 구현
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // 3. 검색 결과 수
                Row(
                  children: [
                    Text(
                      '총 $totalCount 명',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 4. 검색 결과 리스트 표시 영역
          // 아래 코드를 Expanded 위젯 부분에 추가
// 4. 검색 결과 리스트 표시 영역
          Expanded(
            child: Container(
              color: Colors.white,
              // ListView.builder를 사용하여 검색 결과 목록 생성
              child: ListView.builder(
                itemCount: 1, // 데이터 개수
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // 프로필 이미지
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/profile_placeholder.png'), // 프로필 이미지 에셋 경로
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 회원 정보
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 직위와 이름, 기수
                              Row(
                                children: [
                                  const Text(
                                    '총동창회장',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '권은진',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      '20기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // 전공
                              const Text(
                                '경영',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // 회사 정보
                              const Text(
                                '(주)성조파인세라믹대표이사',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 연락처 아이콘
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () {
                                // 전화 걸기 기능 구현
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.article_outlined),
                              onPressed: () {
                                // 상세 정보 보기 기능 구현
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 드롭다운 버튼 - 기수, 직종, 언어 필터
  Widget _buildFilterDropdown({
    required String value, // 현재 선택된 값
    required List<String> items, // 드롭다운 메뉴 항목
    required void Function(String?) onChanged, // 선택 변경 시 호출될 함수
  }) {
    return DropdownButton<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 14,
      ),
      underline: const SizedBox(),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
    );
  }
}